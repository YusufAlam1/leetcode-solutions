SELECT u.user_id AS buyer_id,
    join_date,
    SUM(CASE 
        WHEN order_date 
            BETWEEN '2019-01-01' AND '2019-12-31' 
        THEN 1 
        ELSE 0 END
    ) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.buyer_id
GROUP BY u.user_id;