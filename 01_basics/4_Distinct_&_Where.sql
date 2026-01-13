-- Problem: Write a query to find the author_id who has viewed their own work at least once. They might have viewed it multiple times, but we only want to return each author_id once.

-- Dataset: Views with column_id: article_id, author_id, viewer_id, view_date

-- Approach:
-- 1. Since the author has viewed their own work, the author_id and viewer_id must be the same. So, We have to filter the records where author_id = viewer_id.
-- 2. To remove the duplicate author_id, we will use DISTINCT keyword.
-- 3. Finally, we will order the result by author_id and rename the author_id to id.

SELECT DISTINCT author_id as id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;