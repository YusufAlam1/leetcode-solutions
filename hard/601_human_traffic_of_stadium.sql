WITH w AS (
    SELECT s.*,
        MIN(
            CASE
                WHEN people >= 100 THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY id ROWS BETWEEN CURRENT ROW
                AND 2 FOLLOWING
        ) AS ok_after3,
        COUNT(*) OVER (
            ORDER BY id ROWS BETWEEN CURRENT ROW
                AND 2 FOLLOWING
        ) AS cnt_after3,
        MIN(
            CASE
                WHEN people >= 100 THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
        ) AS ok_mid3,
        COUNT(*) OVER (
            ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
        ) AS cnt_mid3,
        MIN(
            CASE
                WHEN people >= 100 THEN 1
                ELSE 0
            END
        ) OVER (
            ORDER BY id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS ok_before3,
        COUNT(*) OVER (
            ORDER BY id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS cnt_before3
    FROM Stadium s
)
SELECT id,
    visit_date,
    people
FROM w
WHERE (
        cnt_after3 = 3
        AND ok_after3 = 1
    )
    OR (
        cnt_mid3 = 3
        AND ok_mid3 = 1
    )
    OR (
        cnt_before3 = 3
        AND ok_before3 = 1
    )
ORDER BY visit_date;