-- Alter the 'Customers' table's 'id' column with a NOT NULL constraint
-- Next, add a primary key contraint on the 'id' column

ALTER TABLE Customers
ALTER COLUMN id smallint NOT NULL;

GO

ALTER TABLE Customers
ADD CONSTRAINT PK_Customers_ID PRIMARY KEY (id);

GO

-- Alter the 'Employees' table's 'id' column with a NOT NULL constraint
-- Next, add a primary key contraint on the 'id' column

ALTER TABLE Employees
ALTER COLUMN id smallint NOT NULL;

GO

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees_ID PRIMARY KEY (id);

GO

-- Alter the 'Support_Tickets' table's 'id' column with a NOT NULL constraint
-- Next, add a primary key contraint on the 'id' column
-- Finally, Alter the Table again and add foreign keys to 'emp_id' and 'custom_id'

ALTER TABLE Support_Tickets
ALTER COLUMN id smallint NOT NULL

GO

ALTER TABLE Support_Tickets
ADD CONSTRAINT PK_Support_Tickets_ID PRIMARY KEY (id);


ALTER TABLE Support_Tickets
ADD CONSTRAINT FK_Employee_ID FOREIGN KEY (emp_id) REFERENCES Employees(id);

GO

ALTER TABLE Support_Tickets
ADD CONSTRAINT FK_Customer_ID FOREIGN KEY (custom_id) REFERENCES Customers(id);