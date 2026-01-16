-- Problem: To find those customers who visited the mall but did not make any purchases. And the number of such visits of each customer

-- Dataset: Visits table with cols: visit_id, customer_id
-- Dataset: Transactions table with cols: transaction_id, visit_id, amount

-- Approach:
-- 1. Since we need those customers who did not make any transaction, the transaction_id would be null for them if I join the tables.
-- 2. With the LEFT JOIN, I combined both the tables on visit_id.
-- 3. With the WHERE clause, I filtered out those records where transaction_id is null.
-- 4. Finally, I grouped the results by customer_id and counted the number of visits for each customer.

-- SQL Query:
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id