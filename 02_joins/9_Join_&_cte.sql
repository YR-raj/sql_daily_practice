-- Problem:

-- Dataset:

-- Approach:
-- 1.
-- 2.
-- 3.

-- Unoptimized SQL Query:
# Write your MySQL query statement below
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

-- Optimized SQL Query without CTE: