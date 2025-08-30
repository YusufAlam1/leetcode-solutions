WITH Salary_Rank AS (
    SELECT salary,
        DENSE_RANK() OVER (
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
)
SELECT CASE
        WHEN MAX(rnk) < 2 THEN null
        ELSE salary
    END AS SecondHighestSalary
FROM Salary_Rank
WHERE rnk = 2