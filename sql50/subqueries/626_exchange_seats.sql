WITH before_after AS (
    SELECT id,
        student,
        LEAD(student) OVER (
            ORDER BY id
        ) AS `next`,
        LAG(student) OVER (
            ORDER BY id
        ) AS `before`
    FROM Seat
)
SELECT id,
    CASE
        WHEN next IS NULL
        AND id % 2 = 1 THEN student
        WHEN next IS NULL
        AND id % 2 = 0 THEN `before`
        WHEN id % 2 = 1 THEN `next`
        WHEN id % 2 = 0 THEN `before`
    END AS student
FROM before_after