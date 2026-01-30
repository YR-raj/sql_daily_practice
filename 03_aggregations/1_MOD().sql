-- Problem: Find movies with odd IDs that are not boring, ordered by rating in descending order.

-- Dataset: Cinema table with columns: id, movie, description, and rating.

-- Approach:
-- 1. Since we need all fields, we will use star (*) in the SELECT statement.
-- 2. Next, we have to filter the records according to the given two conditions: odd IDs and description not equal to 'boring'.
-- 3. We will use WHERE clause with AND operator to filter the records.
-- 4. In WHERE clause, we will use the MOD() function to check for odd ids and a simple comparison for the description.
-- 5. Finally, we will order the results by rating in descending order using ORDER BY clause.

-- SQL Query:
SELECT *
FROM Cinema
WHERE MOD(id, 2) != 0
    AND description != 'boring'
ORDER by rating DESC