-- Insert new values into the Customer table
-- An error will appear letting you know their is a 
-- primary key viuolation because this means the record
-- already exists based on the employee's id being
-- used already
INSERT INTO Customers(id, first_name, last_name, email)
VALUES (1030, 'Drew', 'McIntyre', 'gdayne@gmail.com'),
	   (2015, 'Clark', 'Kent', 'llang@gmail.com')
SELECT * FROM Customers
ORDER BY id;

GO

-- Create a new table using that compiles all employees that
-- work in the the state of New York
SELECT * INTO New_York_Employees
FROM Employees
WHERE state = 'NY'
ORDER BY first_name;

-- Add Values to the New York Employee table
INSERT INTO New_York_Employees(id, first_name, last_name, email, department, position, city, state)
VALUES (1885, 'Johnny', 'Nitro', 'support@assistancetech.org', 'Support', 'Employee', 'Brooklyn', 'NY'),
	   (2056, 'John', 'Morrison', 'jmorrison@assistancetech.org', 'Services', 'Employee', 'New York City', 'NY');

GO

-- Create a table for Employees that work in the Support department
CREATE TABLE Support_Employees (
	id smallint NOT NULL,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	department varchar(50),
	position varchar(50),
	city varchar(50),
	state varchar(50)
);

-- Insert all the employees that work in the Support department
-- to the new table (Support_Employees) from the Employees table
INSERT INTO Support_Employees
SELECT * 
FROM Employees
WHERE department = 'Support';