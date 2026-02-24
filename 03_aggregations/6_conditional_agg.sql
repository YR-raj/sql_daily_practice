-- Problem: Calculate the total number of transactions, the total amount of transactions, the total number of approved transactions, 
--          and the total amount of approved transactions for each month and country.

-- Dataset: Transactions table with cols: id, country, state, amount, trans_date

-- Approach:
-- 1. Since, we need to group by month and country, we will first use the DATE_FORMAT() function to extract the month from the trans_date col.
-- 2. After this, we will group by month and country to calculate the metrics for each month and country. 
-- 3. We will start by calculating the `total number of transactions` using COUNT() function and total_amount of transactions using SUM() functions.
-- 4. Then, we will use conditional aggregation with COUNT() and SUM() functions and We will use the CASE statement in both of them to filter out the approved transactions.
-- 5. So with COUNT() + CASE statement, we will get the total number of approved transactions and with SUM() + CASE statement, we will get the total amount of approved transactions.

-- SQL Query:
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS `month`,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 ELSE NULL END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' 
                THEN amount ELSE 0 END) AS approved_total_amount 
FROM Transactions 
GROUP BY `month`, country
