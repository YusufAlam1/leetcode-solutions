WITH Earners AS (
    SELECT id
    , DENSE_RANK() OVER (
        PARTITION BY departmentId 
        ORDER BY salary DESC
        ) AS rnk
    FROM Employee
)
SELECT 
    d.name AS Department
    , e.name AS Employee
    , salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
JOIN Earners er ON er.id = e.id
WHERE rnk <=3;