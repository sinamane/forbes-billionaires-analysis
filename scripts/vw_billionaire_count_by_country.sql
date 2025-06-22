USE ForbesDB
GO

IF OBJECT_ID('billionaire_count_by_country', 'V') IS NOT NULL
    DROP VIEW billionaire_count_by_country;
GO 

CREATE VIEW billionaire_count_by_country AS
    SELECT report_year, country_of_citizenship, COUNT(DISTINCT full_name) AS billionaire_count
    FROM forbes_2020_2024
    GROUP BY report_year, country_of_citizenship;

