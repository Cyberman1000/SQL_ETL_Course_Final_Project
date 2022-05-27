-- Using this Query will help identifiy duplicates
-- in the 'id' column for each table and delete them.

-- Once the query is done running, you should see in
-- the 'Messages' window the number of rows deleted

-- USING Common Table Expression (CTE) formula,
-- identify all the duplicate values in the 'id' column of the 'Customers' table
WITH dupleC
AS
(SELECT *, ROW_NUMBER()
OVER (PARTITION BY id ORDER BY id) AS Customer_Duplicates FROM Customers)

-- Use DELETE on the rows that have those duplicate values using the CTE created
DELETE FROM dupleC WHERE Customer_Duplicates <> 1;

GO

-- USING Common Table Expression (CTE) formula,
-- identify all the duplicate values in the 'id' column of the 'Employees' table
WITH dupleE
AS
(SELECT *, ROW_NUMBER()
OVER (PARTITION BY id ORDER BY id) AS Employee_Duplicates FROM Employees)

-- Use DELETE on the rows that have those duplicate values using the CTE created
DELETE FROM dupleE WHERE Employee_Duplicates <> 1;

GO

-- USING Common Table Expression (CTE) formula,
-- identify all the duplicate values in the 'id' column of the 'Support_Tickets' table
WITH dupleST
AS
(SELECT *, ROW_NUMBER()
OVER (PARTITION BY id ORDER BY id) AS Support_Ticket_Duplicates FROM Support_Tickets)

-- Use DELETE on the rows that have those duplicate values using the CTE created
DELETE FROM dupleST WHERE Support_Ticket_Duplicates <> 1;


-- Check if any duplicates remain in Customers Table
SELECT id, COUNT(*) AS duplicates
FROM Customers
GROUP BY id
HAVING COUNT(*) > 1


-- Check if any duplicates remain in Employees Table
SELECT id, COUNT(*) AS duplicates
FROM Employees
GROUP BY id
HAVING COUNT(*) > 1


-- Check if any duplicates remain in Support_Tickets Table
SELECT id, COUNT(*) AS duplicates
FROM Support_Tickets
GROUP BY id
HAVING COUNT(*) > 1;