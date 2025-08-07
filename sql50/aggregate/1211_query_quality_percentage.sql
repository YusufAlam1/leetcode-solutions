WITH Poor AS (
    SELECT query_name,
        COUNT(rating) AS poor
    FROM Queries
    WHERE rating < 3
    GROUP BY query_name
)
SELECT q.query_name,
    ROUND(AVG(q.rating / position), 2) AS quality,
    IFNULL(
        ROUND((AVG(p.poor) / COUNT(q.query_name)) * 100, 2),
        0
    ) AS poor_query_percentage
FROM Queries q
    LEFT JOIN Poor p ON p.query_name = q.query_name
GROUP BY q.query_name;