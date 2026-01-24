-- Problem: Find the number of times each student has taken exams in each subject, including subjects they have never taken an exam in.

-- Dataset: Students table with columns: student_id, student_name
--          Subjects table with columns: subject_name
--          Examinations table with columns: student_id, subject_name

-- Approach:
-- 1. Since we need to find the information about each student for every subject,
    --    we will use a CROSS JOIN between the Students and Subjects tables to create all possible combinations of students and subjects.
    --    Now, each student corrosponds to every subject.

-- 2. for the next step, we will perform a LEFT JOIN with the Examinations table on both student_id and subject_name 
    --    to get the matching records as well as nulls for subjects where the student has not taken any exams since 
    
-- 3. Finally, we will use COUNT to count the number of exams taken by each student for each subject.
    --    We will group the results by student_id, student_name, and subject_name to get the desired output.

-- SQL Query:
# Write your MySQL query statement below
SELECT s.student_id, s.student_name, sb.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sb
LEFT JOIN Examinations e
    ON s.student_id = e.student_id 
    AND sb.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sb.subject_name
ORDER BY s.student_id, sb.subject_name