SELECT project_id,
    ROUND(AVG(experience_years), 2) as average_years
FROM Project
NATURAL JOIN Employee
GROUP BY project_id