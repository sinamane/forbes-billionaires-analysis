USE ForbesDB
GO

SELECT COUNT(*)
FROM billionaires_2020;

-- CHECKING AND REMOVING DUPLICATES
    -- DATA HAS NO DUPLICATES
SELECT 
    full_name,
    country_of_citizenship,
    [month],
    net_worth,
    rank
FROM billionaires_2020
GROUP BY    
    full_name,
    country_of_citizenship,
    [month],
    net_worth,
    rank
HAVING COUNT(*) > 1;

-- CHECKING FOR MISSING VALUES IN CRITICAL COLUMNS
SELECT COUNT(*)
FROM billionaires_2020
WHERE 
    net_worth IS NULL
    OR full_name IS NULL
    OR [month] IS NULL
    OR self_made IS NULL
    OR business_category IS NULL;

-- 43 RECORDS WITH MISSING BIRTHDAYS OR AGES
SELECT COUNT(*)
FROM billionaires_2020
WHERE birth_date IS NULL;

SELECT b.full_name, b.birth_date AS old_birth_date, m.birth_date AS new_birth_date
FROM billionaires_2020 AS b
JOIN missing_birthdays AS m
    ON b.[year] = m.[year] AND b.full_name = m.full_name
WHERE m.birth_date IS NOT NULL
    AND (b.birth_date IS NULL OR b.birth_date != m.birth_date);

-- (15 rows affected)
UPDATE b
SET b.birth_date = m.birth_date
FROM billionaires_2020 AS b
JOIN missing_birthdays AS m
    ON b.[year] = m.[year]
    AND b.full_name = m.full_name
WHERE m.birth_date IS NOT NULL
    AND (b.birth_date IS NULL OR b.birth_date != m.birth_date);

-- UPDATING AGE
SELECT 
    [year], full_name, business_category, birth_date, age,
    (CAST([year] AS INT) - YEAR(CAST(birth_date AS DATE))) AS updated_age
FROM billionaires_2020
WHERE birth_date IS NOT NULL AND age IS NULL;

-- (15 rows affected)
UPDATE billionaires_2020
SET age = CAST([year] AS INT) - YEAR(CAST(birth_date AS DATE))
WHERE birth_date IS NOT NULL AND age IS NULL;

-- REMOVING THE 'B' FROM THE NETWORTH
SELECT full_name, net_worth, TRIM(REPLACE(net_worth, 'B', '')) AS new_networth
FROM billionaires_2020;

UPDATE billionaires_2020
SET net_worth = TRIM(REPLACE(net_worth, 'B', ''));