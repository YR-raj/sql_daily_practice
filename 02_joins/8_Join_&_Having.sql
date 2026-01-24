-- Problem: Find the name of managers who has at least 5 direct reports.

-- Dataset: Employee table with cols: id, name, department, managerId

-- Approach:
-- 1. First I tried to understand the problem requirements and the dataset structure.
-- 2. I identified that I need to count the managerId which is repeated at least 5 times in the Employee table.
-- 3. Since the aggregation is needed, I decided to use GROUP BY and HAVING clause.
-- 4. After getting the desired result table, I created a CTE to improve readability.
-- 5. Finally, I used INNER JOIN to combine the CTE with the Employee table ON condition that managerId from CTE matches id from Employee table to get the manager names.
-- SQL Query with CTE:
WITH main_cte AS(
    SELECT managerId, COUNT(managerId) AS num_of_reports
    FROM Employee 
    GROUP BY managerId
    HAVING num_of_reports >= 5)

SELECT t2.name
FROM main_cte t1
INNER JOIN Employee t2
    ON t1.managerId = t2.id;

-- Alternative Approach:
-- SQL Query without CTE:
SELECT e2.name
FROM Employee e1
JOIN Employee e2
  ON e1.managerId = e2.id
GROUP BY e2.id, e2.name
HAVING COUNT(*) >= 5;
