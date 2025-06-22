USE ForbesDB
GO

IF OBJECT_ID('median_net_worth_by_industry', 'V') IS NOT NULL
    DROP VIEW median_net_worth_by_industry;
GO

CREATE VIEW median_net_worth_by_industry AS
    SELECT DISTINCT
    report_year,
    business_category,
    ROUND(PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY net_worth) 
      OVER (PARTITION BY report_year, business_category), 2) AS median_net_worth
    FROM forbes_2020_2024;