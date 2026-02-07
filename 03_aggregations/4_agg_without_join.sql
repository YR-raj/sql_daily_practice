-- Problem: Find the percentage of users that registered for each contest. 
--          The percentage should be rounded to 2 decimal places. 
--          Return the result table in descending order by percentage and ascending order by contest_id if there is a tie in percentage.

-- Dataset: Users table with columns: user_id, user_name
--          Register table with columns: contest_id, user_id

-- Approach:
-- 1.
-- 2.
-- 3.

-- SQL Query:
SELECT contest_id, ROUND((COUNT(*)/(SELECT COUNT(*)FROM users))*100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;