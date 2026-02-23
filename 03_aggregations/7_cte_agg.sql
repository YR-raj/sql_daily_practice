-- Problem:

-- Dataset:

-- Approach:
-- 1.
-- 2.
-- 3.

-- SQL Query:
WITH main_cte AS(
    SELECT 
        customer_id,
        MIN(Order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
),

main_cte_2 AS(
    SELECT 
        t1.Customer_id,
        t2.order_date
    FROM main_cte t1
    JOIN Delivery t2
        ON t1.customer_id = t2.customer_id
            AND t1.first_order_date = t2.order_date
    WHERE first_order_date = customer_pref_delivery_date 
)

SELECT 
    ROUND((COUNT(customer_id)/(SELECT COUNT(DISTINCT customer_id) FROM Delivery))*100, 2) AS immediate_percentage 
FROM main_cte_2