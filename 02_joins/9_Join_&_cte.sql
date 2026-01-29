-- Problem: Find the confirmation rate for each user_id who tried to sign up. There are those users too who were not able to sign up.

-- Dataset: Signups table with columns: user_id, time_stamp
--          Confirmations table with columns: user_id, time_stamp, action

-- Approach:
-- 1. Since we want to find out about confirmation_rate about EACH user_id, we will LEFT JOIN ON user_id.
-- 2. But before that, we have to count the confirmed actions of each user_id to calculate the confirmation rate.
-- 3. For this, we will use CASE statement to create a new column act_cnt in confirmations table which will have 1 if action is 'confirmed' else 0.
-- 4. Then, we will wrap it up in a CTE called main_cte.
-- 5. Now, we will LEFT JOIN Signups table with main_cte on user_id.
-- 6. Finally, we will GROUP BY user_id and calculate confirmation_rate.
-- 7. For the confirmation rate, we will use SUM(act_cnt)/COUNT(user_id) and ROUND it to 2 decimal places as required.



-- Unoptimized SQL Query:
WITH main_cte As(
    SELECT 
        user_id,
        time_stamp,
        action,
        CASE 
            WHEN action = 'confirmed' THEN 1
            ELSE 0
        END AS act_cnt
    FROM Confirmations)

SELECT 
    t1.user_id, 
    CASE 
        WHEN ROUND(SUM(act_cnt)/COUNT(t2.user_id), 2) IS NULL THEN 0
        ELSE ROUND(SUM(act_cnt)/COUNT(t2.user_id), 2)  
    END AS confirmation_rate
FROM Signups t1
LEFT join main_cte t2
    ON t1.user_id = t2.user_id
GROUP BY t1.user_id


-- Optimized SQL Query:
WITH main_cte AS (
    SELECT 
        user_id,
        COUNT(*) AS total_actions,
        SUM(action = 'confirmed') AS confirmed_actions
    FROM Confirmations
    GROUP BY user_id
    )

SELECT 
    t1.user_id,
    ROUND(IFNULL(confirmed_actions/IFNULL(total_actions, 0), 0), 0) AS confirmation_rate
FROM Signups t1
LEFT JOIN main_cte t2
    ON t1.user_id = t2.user_id



-- Optimized SQL Query without CTE:
SELECT 
    s.user_id,
    ROUND(IFNULL(SUM(c.action = 'confirmed')/COUNT(c.action), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id