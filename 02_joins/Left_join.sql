-- Problem: to find each employee with unique_id and the employee who does not have unique_id, fill it with 'NULL'

-- Dataset: Employees table with cols: id, name
-- Dataset: EmployeeUNI table with cols: id, unique_id           

-- Approach:
-- 1. we will join both the tables using LEFT JOIN (as we want all records from Employees table) ON id column (primary key)
-- 2. we will select unique_id and name columns from the joined result
-- 3. The null values will be automatically filled for employees without unique_id

-- SQL Query:
SELECT unique_id, name 
FROM Employees e
LEFT JOIN EmployeeUNI e_uni
    ON e.id = e_uni.id