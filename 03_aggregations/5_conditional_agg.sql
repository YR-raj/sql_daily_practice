-- Problem: Calculate the quality of each query and the percentage of poor queries for each query name. 
--          The quality of a query is defined as the average rating divided by the position of the query. 
--          A poor query is defined as a query with a rating less than 3.

-- Dataset: Queries table with cols: query_name, result, position, rating

-- Approach:
-- 1. First, we will group by each query_name to calculate the metrics for each query.
-- 2. Then, we will calculate the quality of each query by utilizing the AVG() function and division operator on the rating and position columns and round it to 2 decimal places.
-- 3. Finally, we will use conditional aggregation with SUM() function and CASE statement 
-- 4. With CASE we will filter out ratings more than or equal to 3 and then sum it to get the actual count of poor queries. 
-- 5. Lastly, we will divide the poor queries count by the total queries count and multiply by 100 to get the percentage of poor queries, and round it to 2 decimal places.

-- SQL Query:
SELECT 
    query_name, 
    ROUND(AVG(rating/`position`), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)/COUNT(*)*100,
        2)
    AS poor_query_percentage
FROM Queries
GROUP BY query_name

