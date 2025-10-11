SELECT name
FROM SalesPerson
WHERE name NOT IN (
    SELECT s.name
    FROM Orders o
    LEFT JOIN SalesPerson s ON s.sales_id = o.sales_id
    WHERE com_id = (
        SELECT com_id
        FROM Company
        WHERE name LIKE "RED"
    )
)