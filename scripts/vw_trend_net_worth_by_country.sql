USE ForbesDB
GO 

IF OBJECT_ID('trend_net_worth_by_country', 'V') IS NOT NULL
    DROP VIEW trend_net_worth_by_country;
GO

CREATE VIEW trend_net_worth_by_country AS
SELECT
    report_year,
    country_of_citizenship,
    ROUND(SUM(net_worth), 2) AS total_net_worth
FROM forbes_2020_2024
GROUP BY report_year, country_of_citizenship;

