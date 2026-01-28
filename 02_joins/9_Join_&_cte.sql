-- Problem:

-- Dataset:

-- Approach:
-- 1.
-- 2.
-- 3.

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