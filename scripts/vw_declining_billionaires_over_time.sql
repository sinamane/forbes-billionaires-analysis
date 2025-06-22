USE ForbesDB
GO

IF OBJECT_ID('declining_billionaires', 'V') IS NOT NULL
    DROP VIEW declining_billionaires;
GO

CREATE VIEW declining_billionaires AS
SELECT
    report_year,
    full_name,
    net_worth,
    LAG(net_worth) OVER (PARTITION BY full_name ORDER BY report_year) AS prev_net_worth
FROM forbes_2020_2024;
