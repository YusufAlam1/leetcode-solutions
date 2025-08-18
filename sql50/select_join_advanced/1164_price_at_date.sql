WITH ranked AS (
    SELECT product_id,
        new_price,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS top
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT i.product_id,
    COALESCE(r.new_price, 10) AS price
FROM (
        SELECT DISTINCT product_id
        FROM Products
    ) AS i
    LEFT JOIN ranked r ON r.product_id = i.product_id
    AND r.top = 1;