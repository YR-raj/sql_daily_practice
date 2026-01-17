-- Problem: Find the dates' ID where temperature is higher than the previous day.

-- Dataset: Weather table with columns: id, recordDate, temperature.

-- Approach:
-- 1. Consedering the Problem Statement and the given single table, SELF JOIN seems to be the best approach.
-- 2. We will join the table with itself on the condition that the date difference between the two recordDate is 1 day. For this, we will use DATEDIFF() function.
-- 3. Finally, we will filter the data with the WHERE clause and the given condition that the temperature of the second instance of the table is greater than the first instance.

-- SQL Query:
SELECT w2.id
FROM Weather w1
JOIN Weather w2
    ON DATEDIFF(w2.recordDate, w1.recordDate) = 1
WHERE w2.temperature > w1.temperature