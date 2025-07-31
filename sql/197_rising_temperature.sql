-- MySQL Style
SELECT w1.id
FROM Weather w1
    LEFT OUTER JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

-- SQLite Style
SELECT w1.id
FROM Weather w1
    LEFT OUTER JOIN Weather w2 ON w1.recordDate = DATE(w2.recordDate, '+1 day')
WHERE w1.temperature > w2.temperature;