WITH NotBanned AS (
    SELECT request_at AS `Day`,
        status,
        uc.banned AS client_banned,
        ud.banned AS driver_banned
    FROM Trips t
        LEFT JOIN Users uc ON uc.users_id = t.client_id
        AND uc.banned = 'No'
        LEFT JOIN Users ud ON ud.users_id = t.driver_id
        AND ud.banned = 'No'
)
SELECT `Day`,
    ROUND(
        SUM(
            CASE
                WHEN status LIKE 'cancelled%' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) `Cancellation Rate`
FROM NotBanned
WHERE client_banned = 'No'
    AND driver_banned = 'No'
    AND `Day` BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY `Day`;