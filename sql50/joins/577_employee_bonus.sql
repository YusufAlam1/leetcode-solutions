SELECT e.name, b.bonus
FROM Bonus b
LEFT OUTER JOIN Employee e ON e.empId = b.empId
WHERE bonus < 1000 OR bonus IS NULL;