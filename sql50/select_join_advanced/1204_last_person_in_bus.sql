WITH mass AS (
    SELECT *,
        SUM(weight) OVER (
            ORDER BY turn
        ) AS total_weights
    FROM Queue
)
SELECT person_name
FROM mass
WHERE total_weights <= 1000
ORDER BY turn DESC
LIMIT 1;