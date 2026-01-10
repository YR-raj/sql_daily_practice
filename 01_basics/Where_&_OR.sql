-- Problem: Write a solution to find the customer names who are either referred by another customer with referee_id != 2 or not referred by any customer.

-- Dataset: customers table with columns: id, name, referee_id

-- Approach:
-- 1. Since only the name has been asked, I used SELECT statement wth name column only from customers table.
-- 2. Then filtered the names according to the given conditions using WHERE clause.
-- 3. The requirements were to fulfill at least one of the two conditions, so I used OR operator to combine them.

SELECT name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;