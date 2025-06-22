USE ForbesDB
GO

IF OBJECT_ID('forbes_2020_2024', 'U') IS NOT NULL
    DROP TABLE forbes_2020_2024;
GO

CREATE TABLE forbes_2020_2024(
    id INT IDENTITY(1,1) PRIMARY KEY,
    report_year INT,
    net_worth FLOAT,
    rank INT,
    full_name NVARCHAR(255),
    gender NVARCHAR(10),
    age INT,
    birth_date DATE,
    country_of_citizenship NVARCHAR(255),
    business_category NVARCHAR(255),
    self_made BIT,
    wealth_status NVARCHAR(255)
);

-- INSERT 2020 RECORDS
INSERT INTO forbes_2020_2024 
    (report_year, net_worth, rank, full_name, gender, 
    age, birth_date, country_of_citizenship, business_category, self_made, 
    wealth_status)
SELECT
    TRY_CAST([year] AS INT),
    TRY_CAST(net_worth AS FLOAT),
    TRY_CAST(rank AS INT),
    full_name,
    gender,
    TRY_CAST(age AS INT),
    TRY_CAST(birth_date AS DATE),
    country_of_citizenship,
    business_category,
    TRY_CAST(self_made AS BIT),
    wealth_status
FROM billionaires_2020;

-- INSERT 2021 RECORDS 
INSERT INTO forbes_2020_2024 
    (report_year, net_worth, rank, full_name, gender, 
    age, birth_date, country_of_citizenship, business_category, self_made, 
    wealth_status)
SELECT
    TRY_CAST([year] AS INT),
    TRY_CAST(net_worth AS FLOAT),
    TRY_CAST(rank AS INT),
    full_name,
    gender,
    TRY_CAST(age AS INT),
    TRY_CAST(birth_date AS DATE),
    country_of_citizenship,
    business_category,
    TRY_CAST(self_made AS BIT),
    wealth_status
FROM billionaires_2021;


-- INSERT 2022 RECORDS
INSERT INTO forbes_2020_2024 
    (report_year, net_worth, rank, full_name, gender, 
    age, birth_date, country_of_citizenship, business_category, self_made, 
    wealth_status)
SELECT
    TRY_CAST([year] AS INT),
    TRY_CAST(net_worth AS FLOAT),
    TRY_CAST(rank AS INT),
    full_name,
    gender,
    TRY_CAST(age AS INT),
    TRY_CAST(birth_date AS DATE),
    country_of_citizenship,
    business_category,
    TRY_CAST(self_made AS BIT),
    wealth_status
FROM billionaires_2022;

-- INSERT 2023 RECORDS
INSERT INTO forbes_2020_2024 
    (report_year, net_worth, rank, full_name, gender, 
    age, birth_date, country_of_citizenship, business_category, self_made, 
    wealth_status)
SELECT
    TRY_CAST([year] AS INT),
    TRY_CAST(net_worth AS FLOAT),
    TRY_CAST(rank AS INT),
    full_name,
    gender,
    TRY_CAST(age AS INT),
    TRY_CAST(birth_date AS DATE),
    country_of_citizenship,
    business_category,
    TRY_CAST(self_made AS BIT),
    wealth_status
FROM billionaires_2023;

-- INSERT 2024 RECORDS
INSERT INTO forbes_2020_2024 
    (report_year, net_worth, rank, full_name, gender, 
    age, birth_date, country_of_citizenship, business_category, self_made, 
    wealth_status)
SELECT
    TRY_CAST([year] AS INT),
    TRY_CAST(net_worth AS FLOAT),
    TRY_CAST(rank AS INT),
    full_name,
    gender,
    TRY_CAST(age AS INT),
    TRY_CAST(birth_date AS DATE),
    country_of_citizenship,
    business_category,
    TRY_CAST(self_made AS BIT),
    wealth_status
FROM billionaires_2024;

SELECT TOP 3 *
FROM forbes_2020_2024;

TRUNCATE TABLE forbes_2020_2024;