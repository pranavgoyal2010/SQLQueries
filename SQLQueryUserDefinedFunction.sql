-- Refer website https://www.c-sharpcorner.com/UploadFile/b926a6/function-operation-in-sql-database/

--SQL Server Functions are useful objects in SQL Server databases. 
--A SQL Server function is a code snippet that can be executed on a SQL Server.

--SQL Server supports two types of functions - user-defined and system.
-- 1. User-Defined function: User-defined functions are created by a user.
-- 2. System Defined Function: System functions are built-in database functions. 

SELECT * FROM Employee_Details;

DELETE FROM Employee_Details WHERE id=2;

ALTER TABLE Employee_Details
ALTER COLUMN id INT NOT NULL;

ALTER TABLE Employee_Details
ADD PRIMARY KEY (id);

INSERT INTO Employee_Details VALUES (2, 'Alice', 'Female', 25000, 'New York');

ALTER TABLE Employee_Details
DROP CONSTRAINT [PK__Employee__3213E83F65E51318];

ALTER TABLE Employee_Details
ALTER COLUMN id INT;


---User-Defined Functions
---SQL Server supports two types of user-defined functions:

--- 1. Table-Valued Functions - returns a table
--- 2. Scalar Valued Functions - returns a single value

--- 1. Table-Valued Functions
--creates a function to display all table columns.
CREATE FUNCTION Fun_EmployeeInformation()
RETURNS TABLE
AS
RETURN (SELECT * FROM Employee_Details);

SELECT * FROM Fun_EmployeeInformation();


---2. Scalar Function
CREATE FUNCTION Fun_EmployeeJoinColumn
(
	@EmpName VARCHAR(50),
	@EmpCity VARCHAR(20)
)
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN (@EmpName + ' ' + @EmpCity)
END;


SELECT dbo.Fun_EmployeeJoinColumn(Name, City) AS Detail FROM Employee_Details;


--Following is simple function to print a number
CREATE FUNCTION func_printNum()
RETURNS DECIMAL(7,2)
AS
BEGIN
	RETURN 1000.13;
END;

print dbo.func_printNum();

--Following is an example of function printing the sum of two numbers
CREATE FUNCTION Fun_Addition
(
	@Num1 Decimal(7,2),
    @Num2 Decimal(7,2)
)
RETURNS Decimal(7,2)
BEGIN
    DECLARE @Result Decimal(7,2)
    SET @Result = @Num1 + @Num2
    RETURN @Result
END

print dbo.Fun_Addition(12,13);