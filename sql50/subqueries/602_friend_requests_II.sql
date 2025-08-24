WITH user_friends AS (
    SELECT requester_id,
        SUM(req) AS friends
    FROM (
            SELECT requester_id,
                COUNT(requester_id) AS req
            FROM RequestAccepted
            GROUP BY requester_id
            UNION ALL
            SELECT accepter_id,
                COUNT(accepter_id) AS acc
            FROM RequestAccepted
            GROUP BY accepter_id
        ) AS req_acc
    GROUP BY requester_id
)
SELECT requester_id AS id,
    friends AS num
FROM user_friends
WHERE friends = (
        SELECT MAX(friends)
        FROM user_friends
    )