-- Problem: To find the product_name, year, and price of EACH sale_id from the sales table.

-- Dataset: Sales table with columns: sale_id, product_id, year, quantity, price
-- Dataset: Product table with columns: product_id, product_name

-- Approach:
-- 1. Since we need all the records from the Sales table, we will use a LEFT JOIN.
-- 2. We will join both tables on the product_id column.
-- 3. We will get only those columns in the SELECT statement that are required in the output.

-- SQL Query:
SELECT product_name, year, price
FROM Sales s
LEFT JOIN Product p
    ON s.product_id = p.product_id