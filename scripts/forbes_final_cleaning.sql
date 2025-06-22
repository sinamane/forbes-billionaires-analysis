USE ForbesDB
GO

-- VERIFYING AGES
SELECT TOP 10 *
FROM forbes_2020_2024
ORDER BY age DESC;

UPDATE forbes_2020_2024
SET age = NULL, birth_date = NULL
WHERE full_name = 'Li Ming';

UPDATE forbes_2020_2024
SET 
    birth_date = CAST('1987/03/08' AS DATE), 
    age = report_year - 1987
WHERE full_name = 'Liu Wei';

-- CLEANING NAMES

SELECT full_name
FROM forbes_2020_2024
WHERE full_name LIKE '%"%';

UPDATE forbes_2020_2024
SET full_name = REPLACE(full_name, '³', 'u')
WHERE full_name LIKE '%³%';

UPDATE forbes_2020_2024
SET full_name = REPLACE(full_name, '÷', 'o')
WHERE full_name LIKE '%÷%';

-- Alexis LÛ-Qu¶c
UPDATE forbes_2020_2024
SET full_name = REPLACE(full_name, 'LÛ-Qu¶c', 'Lê-Quôc')
WHERE full_name = 'Alexis LÛ-Qu¶c';

UPDATE forbes_2020_2024
SET full_name = REPLACE(full_name, 'a&#769;','a')
WHERE full_name = 'Roberto Herna&#769;ndez Ramirez';

UPDATE forbes_2020_2024
SET full_name = REPLACE(full_name, '"', '')
WHERE full_name LIKE '%"%';

UPDATE forbes_2020_2024
SET full_name = TRIM(full_name);