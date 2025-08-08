WITH first AS (
    SELECT customer_id,
        order_date od,
        customer_pref_delivery_date cpdd,
        FIRST_VALUE(order_date) OVER(
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS fo
    FROM Delivery
)
SELECT ROUND(
        (
            SELECT COUNT(customer_id)
            FROM first
            WHERE fo = cpdd
        ) / (
            SELECT COUNT(DISTINCT(customer_id))
            FROM first
        ) * 100,
        2
    ) AS immediate_percentage;