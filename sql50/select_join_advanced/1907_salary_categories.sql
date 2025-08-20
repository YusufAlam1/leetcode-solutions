WITH lows as (
    SELECT *
    FROM Accounts
    WHERE income < 20000
),
averages as (
    SELECT *
    FROM Accounts
    WHERE income BETWEEN 20000 AND 50000
),
highs as (
    SELECT *
    FROM Accounts
    WHERE income > 50000
)
SELECT 'Low Salary' as category,
    count(*) as accounts_count
FROM lows
UNION
SELECT 'Average Salary' as category,
    count(*) as accounts_count
FROM averages
UNION
SELECT 'High Salary' as category,
    count(*) as accounts_count
FROM highs