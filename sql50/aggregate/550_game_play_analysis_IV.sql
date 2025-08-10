WITH day_after AS (
    SELECT DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS day_after_first,
        player_id
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
        SUM(
            CASE
                WHEN event_date = day_after_first THEN 1
                ELSE 0
            END
        ) / COUNT(DISTINCT(a.player_id)),
        2
    ) AS fraction
FROM Activity a
    LEFT JOIN day_after d ON d.player_id = a.player_id