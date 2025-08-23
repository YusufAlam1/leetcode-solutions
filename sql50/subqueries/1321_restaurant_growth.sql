WITH `daily_amount` AS (
    SELECT visited_on
        , SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
), 
`aggregate` AS (
    SELECT visited_on
        , SUM(amount) OVER(
            ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount
        , ROUND(
            AVG(amount) OVER(
                ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ), 
            2
        ) AS average_amount
    FROM `daily_amount`
), 
`day_num` AS (
    SELECT *
        , ROW_NUMBER() OVER(
            ORDER BY visited_on
        ) AS day_number
    FROM `aggregate`
)
SELECT visited_on
    , amount
    , average_amount
FROM `day_num`
WHERE day_number >= 7;