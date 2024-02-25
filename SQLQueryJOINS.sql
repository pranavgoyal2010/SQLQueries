CREATE TABLE Student (      
  id int PRIMARY KEY IDENTITY,     
  admission_no VARCHAR(45) NOT NULL,  
  first_name VARCHAR(45) NOT NULL,      
  last_name VARCHAR(45) NOT NULL,  
  age int,  
  city VARCHAR(25) NOT NULL      
);

INSERT INTO Student (admission_no, first_name, last_name, age, city) VALUES
(3354,'Luisa', 'Evans', 13, 'Texas'),       
(2135, 'Paul', 'Ward', 15, 'Alaska'),       
(4321, 'Peter', 'Bennett', 14, 'California'),    
(4213,'Carlos', 'Patterson', 17, 'New York'),       
(5112, 'Rose', 'Huges', 16, 'Florida'),  
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),    
(7555,'Antonio', 'Butler', 14, 'New York'),       
(8345, 'Diego', 'Cox', 13, 'California');

SELECT * FROM Student;

CREATE TABLE Fee (   
  admission_no varchar(45) NOT NULL,  
  course varchar(45) NOT NULL,      
  amount_paid int,    
);  

INSERT INTO Fee (admission_no, course, amount_paid) VALUES
(3354,'Java', 20000),       
(7555, 'Android', 22000),       
(4321, 'Python', 18000),    
(8345,'SQL', 15000),       
(5112, 'Machine Learning', 30000); 

SELECT * FROM Fee;
--INNER Joins return the matching rows from both the tables based on the specified condition.
SELECT Student.admission_no, Student.first_name, Student.last_name, Fee.course, Fee.amount_paid FROM
Fee INNER JOIN Student ON Fee.admission_no = Student.admission_no;

-- Student INNER JOIN Fee  or   Fee INNER JOIN Student     are the same thing
SELECT Student.admission_no, Student.first_name, Student.last_name, Fee.course, Fee.amount_paid FROM
Student INNER JOIN Fee ON Fee.admission_no = Student.admission_no;

--INNER JOIN IT IS COMPULSORY TO INCLUDE A CONDITION 
--CONDITION IS INCLUDED AFTER THE KEYWORD IS ON

--INNER is optional as SQL Server performs INNER JOIN by default.
--INNER JOIN is used when we want to get to know which students have paid their fees. 
SELECT Student.admission_no, Student.first_name, Student.last_name, Fee.course, Fee.amount_paid FROM
Student JOIN Fee ON Fee.admission_no = Student.admission_no;

SELECT * FROM Student;
SELECT * FROM Fee;


--Following is the example of SELF JOIN that joins a table with itself.
SELECT *  
FROM Student S1, Student S2
WHERE S1.id <> S2.iD AND S1.city = S2.city;




--Following is an example of CROSS JOIN where each row is combined with every row from the other table.
--It is like Cartesian product.

--MENTIONING CONDITION IN CROSS JOIN IS OPTIONAL
SELECT * FROM Student CROSS JOIN Fee -- WHERE Student.admission_no=Fee.admission_no;

--Following is an example of LEFT OUTER JOIN which returns all rows from left table but only matching rows from right table.

SELECT * --Student.admission_no, Student.first_name, Student.last_name, Fee.course, Fee.amount_paid  
FROM Student
LEFT OUTER JOIN Fee
ON Student.admission_no = Fee.admission_no; 

--Following is an example of RIGHT OUTER JOIN which returns all rows from the right table and matching rows from the left table.
--OUTER is optional to use
SELECT * FROM Student
RIGHT JOIN Fee
ON Student.admission_no = fee.admission_no;

--FULL OUTER JOIN needs to have condition while a CROSS JOIN does not need a condition.
--It is optional to have condition in CROSS JOIN

SELECT * -- Student.admission_no, Student.first_name, Student.last_name, Fee.course, Fee.amount_paid  
FROM Student  
FULL OUTER JOIN Fee  
ON Student.admission_no = Fee.admission_no;  

--Difference between FULL OUTER JOIN and INNER JOIN
--the main difference between an inner join and a full outer join is that an inner join returns 
--only the rows that have matching values in both tables, while a full outer join combines all rows 
--from both tables and includes NULLs where there is no match.