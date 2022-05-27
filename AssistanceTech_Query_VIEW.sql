-- Create a view of all the Company 'Supervisors'
CREATE VIEW Supervisors
AS
SELECT * FROM Employees
WHERE position = 'Supervisor';

GO

-- Create a view of all the Company workers that are regular employed individuals
-- 
CREATE VIEW Workers
AS
SELECT * FROM Employees
WHERE position = 'Employee';

GO

-- Main Office is in Florida.
-- Create a view reflecting all employees
-- that work there.

-- Create 2 tables with the columns from the original Support Tickets table and join 
-- One will reflect the Completed Tickets and another will reflect the Incomplete tickets

CREATE VIEW Completed_Support_Tickets
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
WHERE Support_Tickets.status = 'Completed';

GO

CREATE VIEW Incompleted_Support_Tickets
AS
SELECT Support_Tickets.id AS Ticket_ID,
	   Support_Tickets.status AS Ticket_Status,
	   Support_Tickets.timestamp_requested AS Timestamp_Resquested,
	   Customers.first_name AS Customer_First_Name,
	   Customers.last_name AS Customer_Last_Name,
	   Customers.email AS Customer_Email
FROM Support_Tickets
LEFT JOIN Customers ON Support_Tickets.custom_id=Customers.id
WHERE Support_Tickets.status = '';