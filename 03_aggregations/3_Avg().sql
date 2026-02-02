-- Problem:

-- Dataset:

-- Approach:
-- 1.
-- 2.
-- 3.

-- SQL Query:
SELECT 
    t1.project_id,
    ROUND(SUM(t2.experience_years)/COUNT(t2.experience_years), 2) AS average_years
FROM Project t1
LEFT JOIN Employee t2
    ON t1.employee_id = t2.employee_id
GROUP BY t1.project_id 

-- SQL Optimized Query:
SELECT 
    t1.project_id,
    ROUND(AVG(t2.experience_years), 2) AS average_years
FROM Project t1
JOIN Employee t2
    ON t1.employee_id = t2.employee_id
GROUP BY t1.project_id 

-- JOIN and INNER JOIN are same.