-- Problem: Write a query to find the name, population, and area of a country with the highest population and area.

-- Dataset: World table with columns: name, continent, area, population, gdp

-- Approach: 
-- 1. Since only name, population, and area have been asked, I fetched that only instead of all columns.
-- 2. As for either of the conditions to be satisfied, I used OR operator to combine them.

SELECT name, population, area
FROM world
WHERE area >= 3000000 
    OR population >= 25000000
