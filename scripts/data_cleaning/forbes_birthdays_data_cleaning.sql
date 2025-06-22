USE ForbesDB
GO

-- CORRECTING IRREGULAR AGES
-- Sebastian Glaser: 1520-01-01
UPDATE missing_birthdays
SET birth_date = '1978-00-00'
WHERE full_name = 'Sebastian Glaser';

UPDATE missing_birthdays
SET birth_date = '1982-00-00'
WHERE full_name = 'Li Jinyang';

-- Karl Knauf: 1909-03-27
UPDATE missing_birthdays
SET birth_date = NULL
WHERE full_name = 'Karl Knauf';

-- Robert Knauf: 1839-05-31
UPDATE missing_birthdays
SET birth_date = NULL
WHERE full_name = 'Robert Knauf';

-- Zhang Hong: Zhang Hong
UPDATE missing_birthdays
SET birth_date = NULL
WHERE full_name = 'Zhang Hong';

-- Yasuhisa Ito : 1902-11-07
UPDATE missing_birthdays
SET birth_date = '1925-00-00'
WHERE full_name = 'Yasuhisa Ito';

SELECT *
FROM missing_birthdays
WHERE 
    TRY_CAST(birth_date AS DATE) IS NOT NULL AND
    YEAR(TRY_CAST(birth_date AS DATE)) < 1930;

--  UPDATING MISSING BIRTHDAYS FOR 2020 BILLIONAIRES
SELECT *
FROM missing_birthdays
WHERE 
    [year] = 2020 
    AND birth_date IS NULL
    AND full_name NOT LIKE '%brothers%' 
    AND full_name NOT LIKE '%&%'
    AND full_name NOT LIKE '%and%'; 

UPDATE missing_birthdays
SET birth_date = '1937-06-17'
WHERE full_name = 'Judy Love';

UPDATE missing_birthdays
SET birth_date = '1951-07-14'
WHERE full_name = 'Klaus-Peter Schulenberg'

UPDATE missing_birthdays
SET birth_date = NULL
WHERE full_name = 'Lu Di';

UPDATE missing_birthdays
SET birth_date = '1970-00-00'
WHERE full_name = 'Karin Schick';

UPDATE missing_birthdays
SET birth_date = '1930-00-00'
WHERE full_name = 'Abdulla bin Ahmad Al Ghurair';

UPDATE missing_birthdays
SET birth_date = '1989-00-00'
WHERE full_name = 'Maximilian Viessmann';

UPDATE missing_birthdays
SET birth_date = '1984-00-00'
WHERE full_name = 'Cheng Yixiao';

UPDATE missing_birthdays
SET birth_date = '1940-01-01'
WHERE full_name = 'Abdulla Al Futtaim';

UPDATE missing_birthdays 
SET birth_date = '1942-01-01'
WHERE full_name = 'Maren Otto';

UPDATE missing_birthdays
SET birth_date = '1972-00-00'
WHERE full_name = 'Christian Herz';

UPDATE missing_birthdays
SET birth_date = '1943-09-28'
WHERE full_name = 'Michaela Herz';

UPDATE missing_birthdays
SET birth_date = '1985-00-00'
WHERE full_name = 'Anna Katharina Viessmann';

--  UPDATING MISSING BIRTHDAYS FOR 2021 BILLIONAIRES
UPDATE missing_birthdays
SET birth_date = '1974-00-00'
WHERE full_name = 'Benjamin Otto';

UPDATE missing_birthdays
SET birth_date = '1948-06-02'
WHERE full_name = 'Gabriella Meister';

UPDATE missing_birthdays
SET birth_date = '1941-00-00'
WHERE full_name = 'Karin Sartorius-Herbst';

UPDATE missing_birthdays
SET birth_date = '1951-00-00'
WHERE full_name = 'Catherine Phillips';

UPDATE missing_birthdays
SET birth_date = '1977-00-00'
WHERE full_name = 'Philip Fayer';

UPDATE missing_birthdays
SET birth_date = '1970-00-00'
WHERE full_name = 'Shu Ping';

UPDATE missing_birthdays
SET birth_date = '1956-00-00'
WHERE full_name = 'Chen Kaichen';

UPDATE missing_birthdays
SET birth_date = '1956-02-21'
WHERE full_name = 'Manas Chiaravanond';

UPDATE missing_birthdays
SET birth_date = '1968-05-01'
WHERE full_name = 'Christine Knauf';

UPDATE missing_birthdays
SET birth_date = '1968-05-01'
WHERE full_name = 'Christine Knauf';

UPDATE missing_birthdays
SET birth_date = '1909-03-27'
WHERE full_name = 'Karl Knauf';

UPDATE missing_birthdays
SET birth_date = '1979-03-04'
WHERE full_name = 'Gisele Trajano';

UPDATE missing_birthdays
SET birth_date = '1970-04-01'
WHERE full_name = 'Jianfeng Wang';

UPDATE missing_birthdays
SET birth_date = '1949-01-01'
WHERE full_name = 'Cho Jyh-jer';

UPDATE missing_birthdays
SET birth_date = '1981-00-00'
WHERE full_name = 'Martin Knauf';

SELECT *
FROM missing_birthdays
WHERE 
    [year] = 2021
    AND birth_date IS NULL
    AND full_name NOT LIKE '%brothers%' 
    AND full_name NOT LIKE '%&%'
    AND full_name NOT LIKE '%and%'
    AND full_name NOT IN (
        SELECT full_name
        FROM missing_birthdays
        WHERE [year] = 2020
    ); 

--  UPDATING MISSING BIRTHDAYS FOR 2022 BILLIONAIRES
UPDATE missing_birthdays
SET birth_date = '1945-01-01'
WHERE full_name = 'Francine von Finck';

UPDATE missing_birthdays
SET birth_date = '1967-00-00'
WHERE full_name = 'Giorgio Perfetti';

UPDATE missing_birthdays
SET birth_date = '1943-10-16'
WHERE full_name = 'Gerda Tschira';

UPDATE missing_birthdays
SET birth_date = '1970-00-00'
WHERE full_name = 'Xue Hua';

UPDATE missing_birthdays
SET birth_date = '1924-12-01'
WHERE full_name = 'Chan Tan Ching-fen';

UPDATE missing_birthdays
SET birth_date = '1969-00-00'
WHERE full_name = 'Karen Virginia Beckmann Legoretta';

UPDATE missing_birthdays
SET birth_date = '1989-10-01'
WHERE full_name = 'Jianping Lai';

UPDATE missing_birthdays
SET birth_date = '1958-01-01'
WHERE full_name = 'Chang Kuo-Ming';

UPDATE missing_birthdays
SET birth_date = '1985-06-01'
WHERE full_name = 'Lu Di';

UPDATE missing_birthdays
SET birth_date = '1955-06-02'
WHERE full_name = 'Fritz Draexlmaier';

UPDATE missing_birthdays
SET birth_date = '1979-01-24'
WHERE full_name = 'Xu Zhenhua';

UPDATE missing_birthdays
SET birth_date = '1982-08-23'
WHERE full_name = 'Justin Yuan';

SELECT *
FROM missing_birthdays
WHERE 
    [year] = 2022
    AND birth_date IS NULL
    AND full_name NOT LIKE '%brothers%' 
    AND full_name NOT LIKE '%&%'
    AND full_name NOT LIKE '%and%'
    AND full_name NOT LIKE '%siblings%'
    AND full_name NOT IN (
        SELECT full_name
        FROM missing_birthdays
        WHERE [year] = 2020 AND [year] = 2021
    ); 

--  UPDATING MISSING BIRTHDAYS FOR 2023 BILLIONAIRES
UPDATE missing_birthdays
SET birth_date = '1976-01-01'
WHERE full_name = 'Tang Rui';

UPDATE missing_birthdays
SET birth_date = '1988-04-12'
WHERE full_name = 'Zhang Hong';

UPDATE missing_birthdays
SET birth_date = '1965-01-01'
WHERE full_name = 'Francesco Saputo';

UPDATE missing_birthdays
SET birth_date = '1967-09-24'
WHERE full_name = 'Cai Hongbin';

SELECT *
FROM missing_birthdays
WHERE 
    [year] = 2023
    AND birth_date IS NULL
    AND full_name NOT LIKE '%brothers%' 
    AND full_name NOT LIKE '%&%'
    AND full_name NOT LIKE '%and%'
    AND full_name NOT LIKE '%siblings%'
    AND full_name NOT IN (
        SELECT full_name
        FROM missing_birthdays
        WHERE 
            [year] = 2020 AND [year] = 2021
            AND [year] = 2022
    ); 

--  UPDATING MISSING BIRTHDAYS FOR 2023 BILLIONAIRES
UPDATE missing_birthdays
SET birth_date = '1973-05-06'
WHERE full_name = 'Jian Yao';

UPDATE missing_birthdays
SET birth_date = '1987-07-29'
WHERE full_name = 'Haoyu Cai';

UPDATE missing_birthdays
SET birth_date = '1973-05-17'
WHERE full_name = 'Stuart Hoegner';

UPDATE missing_birthdays
SET birth_date = '1989-01-01'
WHERE full_name = 'Luo Yuhao';

UPDATE missing_birthdays
SET birth_date = '1967-10-09'
WHERE full_name = 'Ling Tang';

UPDATE missing_birthdays
SET birth_date = '1971-01-01'
WHERE full_name = 'Christian Chabot';

UPDATE missing_birthdays
SET birth_date = '1965-01-01'
WHERE full_name = 'Jean-Louis van der Velde';

UPDATE missing_birthdays
SET birth_date = '1956-01-01'
WHERE full_name = 'Carmen Daurella Aguilera';

SELECT *
FROM missing_birthdays
WHERE 
    [year] = 2024
    AND birth_date IS NULL
    AND full_name NOT LIKE '%brothers%' 
    AND full_name NOT LIKE '%&%'
    AND full_name NOT LIKE '%and%'
    AND full_name NOT LIKE '%siblings%'
    AND full_name NOT IN (
        SELECT full_name
        FROM missing_birthdays
        WHERE 
            [year] = 2020 AND [year] = 2021
            AND [year] = 2022 AND [year] = 2023
    )
ORDER BY full_name; 

-- COMPREHENSIVE UPDATE
UPDATE missing_birthdays
SET birth_date = '1942-09-10'
WHERE full_name = 'Anthony von Mandl';

UPDATE missing_birthdays
SET birth_date = '1941-04-30'
WHERE full_name = 'Guenther Lehmann';

UPDATE missing_birthdays
SET birth_date = '1976-12-22'
WHERE full_name = 'Dong Jinggui';

UPDATE missing_birthdays
SET birth_date = '1970-01-01'
WHERE full_name = 'Shum Chiu Hung';

-- FIX DATE FORMATS
SELECT 
    [year], full_name, 
    birth_date, 
    REPLACE(birth_date, '-00-00', '-01-01') AS date_updated
FROM missing_birthdays
WHERE birth_date LIKE '%-00-00%';

UPDATE missing_birthdays
SET birth_date = REPLACE(birth_date, '-00-00', '-01-01')
WHERE birth_date LIKE '%-00-00%';

SELECT 
    [year], full_name, birth_date,
    REPLACE(birth_date, '-', '/')
FROM missing_birthdays
WHERE birth_date IS NOT NULL;

UPDATE missing_birthdays
SET birth_date = REPLACE(birth_date, '-', '/')
WHERE birth_date IS NOT NULL;

SELECT *
FROM missing_birthdays;