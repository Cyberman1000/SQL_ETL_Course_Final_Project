-- The Support Tickets Table will have zeroes in Employee ID column
-- To make them null, run this Query and make all zero values null 

UPDATE Support_Tickets
SET emp_id = NULL
WHERE emp_id = 0;