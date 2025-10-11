WITH count_orders AS (
    SELECT *, COUNT(order_number) AS order_count
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM count_orders
WHERE order_count = (SELECT 
    MAX(order_count) 
    FROM count_orders
)