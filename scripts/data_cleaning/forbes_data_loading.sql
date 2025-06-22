USE master
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'ForbesDB')
BEGIN 
    ALTER DATABASE ForbesDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ForbesDB
END

CREATE DATABASE ForbesDB
GO

USE ForbesDB
GO

-- CREATE STAGING TABLES FOR FORBES BILLIONAIRES (2020-2024)
-- BILLIONAIRES 2020
IF OBJECT_ID ('billionaires_2020', 'U') IS NOT NULL
    DROP TABLE billionaires_2020;
GO

CREATE TABLE billionaires_2020 (
    year NVARCHAR(MAX),
    month NVARCHAR(MAX),
    rank NVARCHAR(MAX),
    net_worth NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    first_name NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    birth_date NVARCHAR(MAX),
    age NVARCHAR(MAX),
    gender NVARCHAR(MAX),
    country_of_citizenship NVARCHAR(MAX),
    country_of_residence NVARCHAR(MAX),
    city_of_residence NVARCHAR(MAX),
    business_category NVARCHAR(MAX),
    business_industries NVARCHAR(MAX),
    organization_name NVARCHAR(MAX),
    position_in_organization NVARCHAR(MAX),
    self_made NVARCHAR(MAX),
    wealth_status NVARCHAR(MAX)
);
GO

-- BILLIONAIRES 2021
IF OBJECT_ID ('billionaires_2021', 'U') IS NOT NULL
    DROP TABLE billionaires_2021;
GO

CREATE TABLE billionaires_2021 (
    year NVARCHAR(MAX),
    month NVARCHAR(MAX),
    rank NVARCHAR(MAX),
    net_worth NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    first_name NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    birth_date NVARCHAR(MAX),
    age NVARCHAR(MAX),
    gender NVARCHAR(MAX),
    country_of_citizenship NVARCHAR(MAX),
    country_of_residence NVARCHAR(MAX),
    city_of_residence NVARCHAR(MAX),
    business_category NVARCHAR(MAX),
    business_industries NVARCHAR(MAX),
    organization_name NVARCHAR(MAX),
    position_in_organization NVARCHAR(MAX),
    self_made NVARCHAR(MAX),
    wealth_status NVARCHAR(MAX)
);
GO

-- BILLIONAIRES 2022
IF OBJECT_ID ('billionaires_2022', 'U') IS NOT NULL
    DROP TABLE billionaires_2022;
GO

CREATE TABLE billionaires_2022 (
    year NVARCHAR(MAX),
    month NVARCHAR(MAX),
    rank NVARCHAR(MAX),
    net_worth NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    first_name NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    birth_date NVARCHAR(MAX),
    age NVARCHAR(MAX),
    gender NVARCHAR(MAX),
    country_of_citizenship NVARCHAR(MAX),
    country_of_residence NVARCHAR(MAX),
    city_of_residence NVARCHAR(MAX),
    business_category NVARCHAR(MAX),
    business_industries NVARCHAR(MAX),
    organization_name NVARCHAR(MAX),
    position_in_organization NVARCHAR(MAX),
    self_made NVARCHAR(MAX),
    wealth_status NVARCHAR(MAX)
);
GO

-- BILLIONAIRES 2023
IF OBJECT_ID ('billionaires_2023', 'U') IS NOT NULL
    DROP TABLE billionaires_2023;
GO

CREATE TABLE billionaires_2023 (
    year NVARCHAR(MAX),
    month NVARCHAR(MAX),
    rank NVARCHAR(MAX),
    net_worth NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    first_name NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    birth_date NVARCHAR(MAX),
    age NVARCHAR(MAX),
    gender NVARCHAR(MAX),
    country_of_citizenship NVARCHAR(MAX),
    country_of_residence NVARCHAR(MAX),
    city_of_residence NVARCHAR(MAX),
    business_category NVARCHAR(MAX),
    business_industries NVARCHAR(MAX),
    organization_name NVARCHAR(MAX),
    position_in_organization NVARCHAR(MAX),
    self_made NVARCHAR(MAX),
    wealth_status NVARCHAR(MAX)
);
GO

-- BILLIONAIRES 2024
IF OBJECT_ID ('billionaires_2024', 'U') IS NOT NULL
    DROP TABLE billionaires_2024;
GO

CREATE TABLE billionaires_2024 (
    year NVARCHAR(MAX),
    month NVARCHAR(MAX),
    rank NVARCHAR(MAX),
    net_worth NVARCHAR(MAX),
    last_name NVARCHAR(MAX),
    first_name NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    birth_date NVARCHAR(MAX),
    age NVARCHAR(MAX),
    gender NVARCHAR(MAX),
    country_of_citizenship NVARCHAR(MAX),
    country_of_residence NVARCHAR(MAX),
    city_of_residence NVARCHAR(MAX),
    business_category NVARCHAR(MAX),
    business_industries NVARCHAR(MAX),
    organization_name NVARCHAR(MAX),
    position_in_organization NVARCHAR(MAX),
    self_made NVARCHAR(MAX),
    wealth_status NVARCHAR(MAX)
);
GO

-- LOADING DATA INTO TABLES
TRUNCATE TABLE billionaires_2024;
BULK INSERT billionaires_2024
FROM 'C:\Users\USER\OneDrive\Desktop\DSA content\sql_forbes_data\datasets\billionaires_2024.txt'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- CREATE MISSING BIRTHDAYS TABLE
IF OBJECT_ID('missing_birthdays', 'U') IS NOT NULL
    DROP TABLE missing_birthdays;
GO

CREATE TABLE missing_birthdays (
    year NVARCHAR(MAX),
    full_name NVARCHAR(MAX),
    wikidata_id NVARCHAR(MAX),
    birth_date NVARCHAR(MAX)
);
GO
-- LOAD MISSING BIRTHDAYS TABLE
TRUNCATE TABLE missing_birthdays
BULK INSERT missing_birthdays
FROM 'C:\Users\USER\OneDrive\Desktop\DSA content\sql_forbes_data\forbes_with_birth_date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


