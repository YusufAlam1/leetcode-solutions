WITH Consecutive AS (
    SELECT id,
        num,
        LEAD(num) OVER(
            ORDER BY id
        ) AS `1_next`,
        LEAD(num, 2) OVER(
            ORDER BY id
        ) AS `2_next`
    FROM Logs
)
SELECT DISTINCT(num) AS ConsecutiveNums
FROM Consecutive c
WHERE num = `1_next`
    AND num = `2_next`