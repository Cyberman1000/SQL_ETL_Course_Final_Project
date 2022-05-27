-- Use basic SELECT Statements to show that the
-- data from all three files loaded onto the
-- database successfully.

-- The next Three SELECT Statments show specific data from each table

-- Number of Customers
SELECT COUNT(id) AS Number_of_Customers
FROM Customers;

-- Number of Employees in each state
SELECT COUNT(id) AS Number_of_Employees, state
FROM Employees
GROUP BY state;

-- Number of Completed Support Tickets
SELECT COUNT(status) AS Number_of_Completed_Tickets, status AS Status
FROM Support_Tickets
WHERE status = 'Completed'
GROUP BY status;


-- Using data generators results in duplicates being created
-- Use the following SELECT Statements to Find any duplicate values in
-- the 'id' column for each table. Why? that is because this column will
-- contain a primary key for each table


-- Find duplicates in Customers Table
SELECT id, COUNT(*) AS duplicates
FROM Customers
GROUP BY id
HAVING COUNT(*) > 1


-- Find duplicates in Employees Table
SELECT id, COUNT(*) AS duplicates
FROM Employees
GROUP BY id
HAVING COUNT(*) > 1


-- Find duplicates in Support_Tickets Table
SELECT id, COUNT(*) AS duplicates
FROM Support_Tickets
GROUP BY id
HAVING COUNT(*) > 1;