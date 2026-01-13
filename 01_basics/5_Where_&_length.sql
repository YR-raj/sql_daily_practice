-- Problem: To find those tweets which exceeds specified length.

-- Dataset: Tweets table with columns: tweet_id, content.

-- Approach:
-- 1. Since only the id has been asked, I used SELECT to get tweet_id only.
-- 2. There is a condition to this problem, so I have to use WHERE clause.
-- 3. Finally, according to the condition, I have to use CHAR_LENGTH function to get the length of content and filter those which are greater than 15.

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15