-- Problem: Find the percentage of users that registered for each contest. 
--          The percentage should be rounded to 2 decimal places. 
--          Return the result table in descending order by percentage and ascending order by contest_id if there is a tie in percentage.

-- Dataset: Users table with columns: user_id, user_name
--          Register table with columns: contest_id, user_id

-- Approach: 
-- 1. We will group by contest_id first from the Register table since we want info about each contest.
-- 2. Now, in order to calculate the percentage, we need to take info from both the tables without joing them. 
--    If we join we won't be able to get the total number of user_id as in the merged table,
--    we will have same number of user_id as in the Register table because we are making groups per contest_id. 

-- 3. So, to get the total number of users, we can use a subquery that counts the number of entries in the Users table.
-- 4. Finally, we will order the result by percentage in descending order and by contest_id in ascending order in case of ties.

-- SQL Query:
SELECT 
    contest_id, 
    ROUND(
        (COUNT(*)/(SELECT COUNT(*) FROM users))*100,
    2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;

-- Python Query:
