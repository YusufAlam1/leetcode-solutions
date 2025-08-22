WITH rating_counts AS (
    SELECT name
        , u.user_id
        , COUNT(u.user_id) AS ratings
    FROM MovieRating m
        JOIN Users u ON u.user_id = m.user_id
    GROUP BY u.user_id
),
movie_averages AS (
    SELECT title
        , m.movie_id
        , AVG(mr.rating) AS average_rating
    FROM Movies m
        JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id
)
SELECT (
        SELECT name
        FROM rating_counts
        WHERE ratings = (
                SELECT MAX(ratings)
                FROM rating_counts
            )
        ORDER BY name
        LIMIT 1
    ) AS results
UNION ALL
(
    SELECT title
    FROM movie_averages
    WHERE average_rating = (
            SELECT MAX(average_rating)
            FROM movie_averages
        )
    ORDER BY title
    LIMIT 1
)