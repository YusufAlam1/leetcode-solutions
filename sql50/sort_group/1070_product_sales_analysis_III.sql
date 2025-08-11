WITH first AS (
    SELECT sale_id,
        DENSE_RANK() OVER(
            PARTITION BY product_id
            ORDER BY year
        ) as year_num
    FROM Sales
)
SELECT product_id,
    year AS first_year,
    quantity,
    price
FROM Sales s
    JOIN first f ON s.sale_id = f.sale_id
WHERE year_num = 1;