-- More than twice as fast as other solution
SELECT name AS results
FROM (
    SELECT u.name,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC, u.name) AS count_rank
    FROM Users u
    JOIN MovieRating mr ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
) AS most_active
WHERE count_rank = 1
UNION ALL
SELECT title AS results
FROM (
    SELECT m.title,
        ROW_NUMBER() OVER (ORDER BY AVG(rating) DESC, m.title) AS count_rank
    FROM Movies m
    JOIN MovieRating mr ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id, m.title
) AS greatest_average
WHERE count_rank = 1;

-- WITH rating_counts AS (
--     SELECT name
--         , u.user_id
--         , COUNT(u.user_id) AS ratings
--     FROM MovieRating m
--         JOIN Users u ON u.user_id = m.user_id
--     GROUP BY u.user_id
-- ),
-- movie_averages AS (
--     SELECT title
--         , m.movie_id
--         , AVG(mr.rating) AS average_rating
--     FROM Movies m
--         JOIN MovieRating mr ON m.movie_id = mr.movie_id
--     WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
--     GROUP BY m.movie_id
-- )
-- SELECT (
--         SELECT name
--         FROM rating_counts
--         WHERE ratings = (
--                 SELECT MAX(ratings)
--                 FROM rating_counts
--             )
--         ORDER BY name
--         LIMIT 1
--     ) AS results
-- UNION ALL
-- (
--     SELECT title
--     FROM movie_averages
--     WHERE average_rating = (
--             SELECT MAX(average_rating)
--             FROM movie_averages
--         )
--     ORDER BY title
--     LIMIT 1
-- )