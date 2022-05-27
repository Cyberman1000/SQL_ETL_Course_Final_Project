-- Use a stored procedure to store a queries for more organized data
-- and easier search results

-- NOTE: Once the procedures are created, you get an error if you run it again.
-- Please just ignore this.
-- If you want different searches for the first three search procedures,
-- change the values where the procedure is executed

-- This procedure searches a customer based on their first
-- and last names. The Information of the customer will display
-- if the their name is on record.
CREATE PROCEDURE Customer_Search @Customer_First_Name varchar(50),
								 @Customer_Last_Name varchar(50)
AS
SELECT * FROM Customers
WHERE first_name = @Customer_First_Name AND last_name = @Customer_Last_Name;

GO

-- Execute the procedure, change values if you want.
EXEC Customer_Search @Customer_First_Name = 'Antone', @Customer_Last_Name = 'Ciotti';

GO

-- This procedure searches an employee based on their first
-- and last names. The Information of the employee will display
-- if the their name is on record.
CREATE PROCEDURE Employee_Search @Employee_First_Name varchar(50),
								 @Employee_Last_Name varchar(50)
AS
SELECT * FROM Employees
WHERE first_name = @Employee_First_Name AND last_name = @Employee_Last_Name;

GO

-- Execute the procedure, change values if you want.
EXEC Employee_Search @Employee_First_Name = 'Marley', @Employee_Last_Name = 'Doughty';

GO

-- This procedure searches a support ticket based on the ticket's id number.
-- The information of the ticket will display if it is on record.
CREATE PROCEDURE Ticket_Search @Ticket_ID smallint
AS
SELECT * FROM Support_Tickets
WHERE id = @Ticket_ID;

GO

-- Execute the procedure, change values if you want.
EXEC Ticket_Search @Ticket_ID = 5041;

GO

-- Create a more orgranized Completed Support Ticket data
-- visulaization in order by the timestamp requested and join the
-- Employee and Customer data based on the employee and customer
-- ID numbers.
CREATE PROCEDURE Completed_Tickets_By_Timestamp
AS
SELECT Support_Tickets.id AS Ticket_ID,
	   Support_Tickets.status AS Ticket_Status,
	   Support_Tickets.timestamp_requested AS Timestamp_Resquested,
	   Employees.first_name AS Employee_First_Name,
	   Employees.last_name AS Employee_Last_Name,
	   Employees.email AS Employee_Email,
	   Employees.department AS Employee_Department,
	   Customers.first_name AS Customer_First_Name,
	   Customers.last_name AS Customer_Last_Name,
	   Customers.email AS Customer_Email
FROM Support_Tickets
LEFT JOIN Employees ON Support_Tickets.emp_id=Employees.id 
LEFT JOIN Customers ON Support_Tickets.custom_id=Customers.id
WHERE Support_Tickets.status = 'Completed'
ORDER BY Timestamp_Resquested;

GO

-- Execute the procedure
EXEC Completed_Tickets_By_Timestamp;

GO

-- Create a more orgranized Incompleted Support Ticket data
-- visulaization in order by the timestamp requested and join the
-- Employee and Customer data based on the employee and customer
-- ID numbers.
CREATE PROCEDURE Incompleted_Tickets_By_Timestamp
AS
SELECT Support_Tickets.id AS Ticket_ID,
	   Support_Tickets.status AS Ticket_Status,
	   Support_Tickets.timestamp_requested AS Timestamp_Resquested,
	   Customers.first_name AS Customer_First_Name,
	   Customers.last_name AS Customer_Last_Name,
	   Customers.email AS Customer_Email
FROM Support_Tickets
LEFT JOIN Customers ON Support_Tickets.custom_id=Customers.id
WHERE Support_Tickets.status = ''
ORDER BY Timestamp_Resquested;

GO

-- Execute the procedure
EXEC Incompleted_Tickets_By_Timestamp;
