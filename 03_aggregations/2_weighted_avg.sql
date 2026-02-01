-- Problem: Calculate the average selling price of each product_id. rounded to 2 decimal places. If a product does not have any sales, return 0 as the average price.

-- Dataset: Prices table with columns: product_id, start_date, end_date, price
--         UnitsSold table with columns: product_id, purchase_date, units

-- Approach:
-- 1. After understanding the problem, some things were clear already like we need to join the tables and there will be group by as there is going to be aggregation involved.
-- 2. So, first I joined the tables on product_id and I used LEFT JOIN to make sure I get all the products from Prices table.
-- 3. Now, the joining of the table will have another conndition that is the purchase_date should be between start_date and end_date because each sale gets the price that was valid at the time of purchase.
-- 4. After join the tables logically, I will calculate the average price. One thing to note here is that this is not a normal average, 
--    Since different quantities were sold at different prices, I used a weighted average rather than a simple average.
-- 5. So, the formula for weighted average is SUM(price * units) / SUM(units). I will use this formula to calculate the average price.
-- 6. Finally, I will use IFNULL to return 0 if there are no sales for a product and ROUND to round the average price to 2 decimal places.


-- SQL Query:
SELECT 
    t1.product_id,
    IFNULL(ROUND(SUM(t1.price*t2.units)/SUM(t2.units), 2), 0) AS average_price
FROM Prices t1
LEFT JOIN UnitsSold t2
    ON t1.product_id = t2.product_id
        AND t2.purchase_date >= t1.start_date AND t2.purchase_date <= t1.end_date
GROUP BY t1.product_id;
