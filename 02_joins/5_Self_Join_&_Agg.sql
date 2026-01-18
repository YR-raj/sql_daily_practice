-- Problem: Find the average time taken by each machine to complete a process.

-- Dataset: Activity table with cols: machine_id, process_id, activity_type, timestamp

-- Approach:
-- 1. After the understanding the problem statement, I figured out that we have to make a pair of start and end event in such a way that we can get the processing time with the formula given (end - start).
-- 2. Since the start and end events are stored as separate rows in the same table, this clearly indicates the need for a self-join on the Activity table.
-- 3. The conditions for joining the table are:
--    a. machine_id should be same in both the instances of the table.
--    b. process_id should be same in both the instances of the table.
--    c. However, the activity_type in the first instance should be 'end' and in the second instance should be 'start'. (hence, end - start)
-- 4. After joining the table, we have to group the result by machine_id and have to use the AVG function to get the average processing time for each machine.
-- 5. Finally, we have to round the average processing time to three decimal places and order the result by machine_id.

-- SQL Query:
SELECT a1.machine_id, ROUND(AVG(a1.timestamp - a2.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
    ON (a1.machine_id = a2.machine_id 
            AND a1.process_id = a2.process_id)
    AND (a1.activity_type = 'end' 
            AND a2.activity_type = 'start')
GROUP BY a1.machine_id
ORDER BY a1.machine_id