-- Use this Query to create a function to calculate the number of employees
-- in a department at AssistanceTech.

-- NOTE: You will receive an error every time letting you know that the function
-- is already created after runinning the query once. So, you can just ignore that
-- error and go to the results which will already be updated with your intended result
-- when using the function.

-- CREATE FUNCTION 
CREATE FUNCTION Number_of_Employees_In_Department(@Department varchar(50))
RETURNS TABLE
AS
RETURN(
	SELECT department AS Department, COUNT(*) AS Number_of_Employees
	FROM Employees
	WHERE department = @Department
	GROUP BY department
);
GO

-- Run Function here change department name by choosing another from the list created
SELECT * FROM Number_of_Employees_In_Department('Training');

-- List of Departments to choose from
SELECT department AS Departments
FROM Employees
GROUP BY department;