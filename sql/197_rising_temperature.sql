-- Using Self Join
SELECT w1.id
FROM Weather w1
    -- LEFT OUTER JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY) -- MySql Syntax
    -- LEFT OUTER JOIN Weather w2 ON w1.recordDate = DATE(w2.recordDate, '+1 day') -- SQLIte Syntax
WHERE w1.temperature > w2.temperature;

-- Using LAG and DATEDIFF functions
SELECT id
FROM (
        SELECT *,
            LAG(recordDate, 1) OVER (
                ORDER BY recordDate
            ) AS yesterday,
            LAG(temperature, 1) OVER (
                ORDER BY recordDate
            ) AS yesterday_temp
        FROM Weather
    ) AS w
WHERE w.temperature > w.yesterday_temp
    AND DATEDIFF(w.recordDate, w.yesterday) = 1;