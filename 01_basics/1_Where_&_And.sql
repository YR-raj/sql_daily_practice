-- Problem: Write a solution to find the product ids that are both low fat and recyclable.

-- Dataset: products table with columns: product_id, low_fats, recyclable

-- Approach: 
-- 1. Use a SELECT & FROM statement to retrieve the product ids only from the products table. 
-- 2. Use WHERE Clause to filter the product ids that are both low fat and recyclable.
-- 3. Use AND operator to validate both conditions.

SELECT product_id
FROM Products
Where low_fats = 'Y' AND recyclable = 'Y'