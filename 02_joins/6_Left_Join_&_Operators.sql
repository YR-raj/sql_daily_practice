-- Problem: To find those employees who either has bonus less than 1000 or does not have any bonus at all.

-- Dataset: Employee table with columns: empId, name, supervisor, salary
-- Dataset: Bonus table with columns: empId, bonus

-- Approach:
-- 1. Since we want to know about each employee, we will perform a LEFT JOIN ON empId to get all records from Employee table.
-- 2. We will apply WHERE clause to filter out employees according to the given conditions.
-- 3. Finally, we will select the required columns to display the result.

-- SQL Query:
SELECT name, bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000
    OR b.bonus IS NULL