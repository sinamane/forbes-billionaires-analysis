USE ForbesDB
GO

---- GROWTH IN BILLIONAIRE COUNT PER INDUSTRY POST-COVID ----

-- QUERY 1
--  Count the number of unique industries (business categories) represented across all years
SELECT COUNT(DISTINCT business_category)
FROM forbes_2020_2024;

-- QUERY 2
-- Track the number of billionaires in each industry by year to observe growth trends after COVID-19
SELECT 
    report_year, 
    business_category, 
    COUNT(business_category) AS billionaire_count
FROM forbes_2020_2024
GROUP BY report_year, business_category
ORDER BY report_year ASC, billionaire_count DESC;

-- QUERY 3
-- Track the number of billionaires in each country by year to observe growth trends after COVID-19
SELECT 
    report_year, 
    country_of_citizenship, 
    COUNT(country_of_citizenship) AS billionaire_count
FROM forbes_2020_2024
WHERE country_of_citizenship = 'South Africa'
GROUP BY report_year, country_of_citizenship
ORDER BY report_year ASC, billionaire_count DESC;


-- QUERY 4
-- Identify the highest median net-worth by country for every year
WITH median_cte AS (
    SELECT 
        report_year,
        country_of_citizenship,
        ROUND(PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY net_worth) 
            OVER (PARTITION BY report_year, country_of_citizenship), 2) AS median_net_worth
    FROM forbes_2020_2024
    -- no GROUP BY needed with window functions
),
ranked_cte AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY report_year ORDER BY median_net_worth DESC) AS rn
    FROM median_cte
)
SELECT report_year, country_of_citizenship, median_net_worth
FROM ranked_cte
WHERE rn = 1
ORDER BY report_year;

-- QUERY 5
-- Identify the most, median, and least dominant industries (by billionaire count)
WITH industry_counts AS( --Counts billionaires by industry
    SELECT 
        report_year, 
        business_category, 
        COUNT(*) AS billionaire_count
    FROM forbes_2020_2024
    GROUP BY report_year, business_category
),
ranked_industries AS ( -- Adds rankings in both directions + industry count per year
    SELECT
        report_year,
        business_category,
        billionaire_count,
        ROW_NUMBER() OVER (PARTITION BY report_year ORDER BY billionaire_count DESC) AS rn_desc,
        ROW_NUMBER() OVER (PARTITION BY report_year ORDER BY billionaire_count ASC) AS rn_asc,
        COUNT(*) OVER (PARTITION BY report_year) AS total_industries
    FROM industry_counts
),
selected_industries AS ( -- Calculates the median rank dynamically
    SELECT *,
        CEILING(total_industries/2.0) AS median_rank
    FROM ranked_industries
)
SELECT report_year, business_category, billionaire_count, 'Top' as category
FROM selected_industries
WHERE rn_desc = 1 OR rn_desc = 2 OR rn_desc = 3

UNION ALL 

SELECT report_year, business_category, billionaire_count, 'Median' as category
FROM selected_industries
WHERE rn_desc = median_rank

UNION ALL

SELECT report_year, business_category, billionaire_count, 'Bottom' as category
FROM selected_industries
WHERE rn_asc = 1
ORDER BY report_year, category DESC;


---- CHANGE IN WEALTH STATUS PER COUNTRY OR SECTOR ----

-- QUERY 1
-- Calculates the total net worth of all billionaires per country for each year.
-- Used to track how billionaire wealth changes across countries over time.
-- Helps identify which countries are growing or shrinking in total billionaire wealth.
SELECT report_year, country_of_citizenship, ROUND(SUM(net_worth), 2) AS sum_net_worth
FROM forbes_2020_2024
GROUP BY report_year, country_of_citizenship
ORDER BY report_year, sum_net_worth DESC;

-- QUERY 2
-- Counts unique billionaires per country per year to track growth or decline in count over time.
-- Helps identify whether a country is gaining or losing billionaires year by year.
-- US: 964 while Tanzania: 1 Median - Ukraine:9 and Vietnam: 8
-- CALLS VIEW
SELECT *
FROM billionaire_count_by_country
ORDER BY report_year, billionaire_count DESC;


-- QUERY 3
-- Sums the net worth of all South African billionaires each year.
-- Used to show whether South African billionaire wealth is growing or declining over time.
-- Helps focus on a single country for localized analysis
SELECT report_year, ROUND(SUM(net_worth), 2) AS sum_net_worth
FROM forbes_2020_2024
WHERE country_of_citizenship = 'South Africa'
GROUP BY report_year
ORDER BY report_year, sum_net_worth DESC;

-- QUERY 4
-- Shows each South African billionaire's net worth by year.
-- Ordered to highlight top earners in each year (e.g., Nicky Oppenheimer).
-- Lets you track individual billionaire trends and see who drives national wealth totals.
-- Nicky Oppenheimer & family is the number one billionaire in South Africa, with upward treand from 2020-2024
SELECT report_year, full_name, net_worth
FROM forbes_2020_2024
WHERE country_of_citizenship = 'South Africa'
ORDER BY report_year, net_worth DESC;

-- QUERY 5
-- Calculates the total net worth per industry (business_category) for each year globally.
-- Helps identify which industries generate the most billionaire wealth annually.
-- Can be used to observe sectoral shifts — e.g., Tech dominating post-COVID.
-- There are more billionaires in Finance & Investments but Technology brought in the most money globally every year
SELECT report_year, business_category, ROUND(SUM(net_worth), 2) AS sum_net_worth
FROM forbes_2020_2024
GROUP BY report_year,business_category
ORDER BY report_year, sum_net_worth DESC;

-- QUERY 6
-- Like the previous query, but limited to South African billionaires only.
-- Tracks which industries in South Africa contributed the most billionaire wealth per year.
-- Useful for comparing local vs. global sector trends.
-- Metals & Mining was no.1 from 2020-2022 but Fashion & Retail moved from the second postion to no.1
SELECT report_year, business_category, ROUND(SUM(net_worth), 2) AS sum_net_worth
FROM forbes_2020_2024
WHERE country_of_citizenship = 'South Africa'
GROUP BY report_year,business_category
ORDER BY report_year, sum_net_worth DESC;


---- MEDIAN NET WORTH BY BUSINESS CATEGORY (e.g., Tech, Retail, Energy) ----

-- QUERY 1
-- Calculates the median billionaire net worth for each industry (business_category) per year.
-- Useful for understanding the typical net worth in each sector, not just the total.
-- More resistant to outliers than SUM or AVG, which can be skewed by ultra-rich individuals.
-- Analyze industries with high median wealth in 2024
-- CALLS VIEW
SELECT *
FROM median_net_worth_by_industry
ORDER BY report_year, business_category;


-- QUERY 2 
-- Calculates the median net worth of billionaires in the top 10 countries per year.
-- Uses a window function to get the median within each country-year group.
-- SELECT DISTINCT removes duplicates since the windowed median repeats per row.
WITH top_countries AS (
    SELECT report_year, country_of_citizenship
    FROM (
        SELECT 
            report_year, 
            country_of_citizenship,
            COUNT(DISTINCT full_name) AS billionaire_count,
            ROW_NUMBER() OVER (PARTITION BY report_year ORDER BY COUNT(DISTINCT full_name) DESC) AS rn
        FROM forbes_2020_2024
        GROUP BY report_year, country_of_citizenship
    ) AS ranked
    WHERE rn <= 10
), filtered_billionaires AS (
    SELECT f.*
    FROM forbes_2020_2024 f
    JOIN top_countries t
        ON f.report_year = t.report_year
        AND f.country_of_citizenship = t.country_of_citizenship
), median_calc AS (
    SELECT
        report_year,
        country_of_citizenship,
        net_worth,
        PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY net_worth)
            OVER (PARTITION BY report_year, country_of_citizenship) AS median_net_worth
    FROM filtered_billionaires
)
SELECT DISTINCT
    report_year,
    country_of_citizenship,
    median_net_worth
FROM median_calc
ORDER BY report_year, median_net_worth DESC;

---- GENDER OR AGE DISTRIBUTION OF NEW VS. DECLINING BILLIONAIRES ----

-- QUERY 1
-- Ranks billionaires by net worth per year.
-- Helps identify the top 10 wealthiest individuals each year from 2020–2024.
-- Can be used to analyze trends like industry dominance or individual trajectories.
SELECT 
    report_year,
    full_name,
    business_category,
    net_worth
FROM top_ranking_billionaires
WHERE rn_desc <= 10 
ORDER BY report_year, net_worth DESC;

-- QUERY 2
-- Filters the dataset for female billionaires.
-- Ranks them by net worth each year and extracts the top 10.
-- Useful for tracking gender representation at the highest levels of wealth.
SELECT 
    report_year,
    full_name,
    business_category,
    net_worth
FROM top_ranking_billionaires
WHERE rn_desc <= 10 
ORDER BY report_year, net_worth DESC;

-- QUERY 3
-- Filters the dataset for male billionaires.
-- Ranks them by net worth each year and extracts the top 10.
-- Provides a basis for comparison with female counterparts.
WITH ranked_billionaires AS(
    SELECT 
        report_year, 
        net_worth,
        gender,
        ROW_NUMBER() OVER(PARTITION BY report_year ORDER BY net_worth DESC) as rn_desc
    FROM forbes_2020_2024
    WHERE gender = 'Male'
)
SELECT
    report_year,
    gender,
    net_worth
FROM ranked_billionaires
WHERE rn_desc <= 10
ORDER BY report_year, net_worth DESC;

-- QUERY 4
-- Finds the youngest billionaire for each year from 2020–2024.
-- Orders by age (ascending) within each year, returning one person per year.
-- Offers insight into generational trends and new wealth emergence.
-- Excludes null ages to ensure only valid data is used.
WITH youngest_billionaire AS(
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY report_year ORDER BY age) as rn_desc
    FROM forbes_2020_2024
    WHERE age IS NOT NULL
)
SELECT 
    full_name,
    net_worth,
    age,
    gender,
    self_made,
    business_category,
    report_year
FROM youngest_billionaire
WHERE rn_desc = 1
ORDER BY report_year, net_worth DESC;

-- Selects all billionaires whose net worth has declined compared to the previous year.
-- Assumes `declining_billionaires` is a view or CTE that includes previous net worth values for comparison.
SELECT *
FROM declining_billionaires
WHERE net_worth < prev_net_worth;

-- Tracks the year-over-year trend in total billionaire net worth for the United Kingdom.
-- Useful for understanding economic or sector shifts in that country over time.
SELECT *
FROM trend_net_worth_by_country
WHERE country_of_citizenship = 'United Kingdom'
ORDER BY report_year;


