USE ForbesDB
GO

IF OBJECT_ID('top_ranking_billionaires', 'V') IS NOT NULL
    DROP VIEW top_ranking_billionaires;
GO

CREATE VIEW top_ranking_billionaires AS
    WITH ranked_billionaires AS(
        SELECT 
            report_year, 
            full_name, 
            net_worth,
            business_category,
            ROW_NUMBER() OVER(PARTITION BY report_year ORDER BY net_worth DESC) as rn_desc
        FROM forbes_2020_2024
    )
    SELECT
        report_year,
        full_name,
        business_category,
        net_worth,
        rn_desc
    FROM ranked_billionaires
    