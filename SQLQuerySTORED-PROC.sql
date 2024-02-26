--STORED PROCEDURE WITH INPUT PARAMETERS

CREATE TABLE Employee_Details(
	id INT,
	Name VARCHAR(50),
	Gender VARCHAR(10),
	Salary MONEY,
	City VARCHAR(20)
);

SELECT * FROM Employee_Details;

INSERT INTO Employee_Details VALUES 
(1, 'John', 'Male', 20000, 'Mumbai'),
(2, 'Alice', 'Female', 25000, 'New York'),
(3, 'Michael', 'Male', 30000, 'London'),
(4, 'Emily', 'Female', 22000, 'Paris'),
(5, 'David', 'Male', 28000, 'Tokyo');

CREATE PROCEDURE spGetEmployees
AS
BEGIN
SELECT * FROM Employee_Details;
END

--can use the following command to execute the defined procedure
spGetEmployees;

-- or this is also okay
exec spGetEmployees;

--Defining a procedure with 1 parameter.
CREATE PROCEDURE spGetEmployeesById
@id int
AS
BEGIN
SELECT * FROM Employee_Details WHERE id=@id;
END

spGetEmployeesById 3;

--Defining a procedure with 2 parameter.
CREATE PROCEDURE spGetEmployeesByIdAndName
@id int,
@Name varchar(50)
AS
BEGIN
SELECT * FROM Employee_Details WHERE id=@id AND Name=@Name;
END

exec spGetEmployeesByIdAndName 4, 'Emily';

-- Throws error as the order of parameters are changed and it can't convert 'Emily' to an integer
exec spGetEmployeesByIdAndName 'Emily', 4;

--no error is thrown but no rows are displayed as there in no name as 4
exec spGetEmployeesByIdAndName '8', 4;

ALTER PROCEDURE spGetEmployeesByIdAndName
@id int,
@Name varchar(50)
AS
BEGIN
SELECT Name, Salary FROM Employee_Details 
WHERE id=@id AND Name=@Name;
END

spGetEmployeesByIdAndName 2, 'Alice';

sp_helptext spGetEmployeesByIdAndName;

--following command allows for adding encrytion to the function
ALTER PROCEDURE spGetEmployeesByIdAndName
@id int,
@Name varchar(50)
WITH ENCRYPTION
AS
BEGIN
SELECT Name, Salary FROM Employee_Details 
WHERE id=@id AND Name=@Name;
END
--when I try to display the contents of this function it will not display as this is encrypted
sp_helptext spGetEmployeesByIdAndName;



--STORED PROCEDURE WITH OUTPUT PARAMETERS
CREATE PROC spGetEmployeesByGender
@Gender varchar(50),
@EmployeeCount int Output
AS
BEGIN
	SELECT @EmployeeCount = Count(id) FROM Employee_Details
	WHERE Gender = @Gender;
END

DECLARE @TotalEmployee INT
exec spGetEmployeesByGender 'male', @TotalEmployee OUTPUT
SELECT @TotalEmployee;