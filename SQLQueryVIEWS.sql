CREATE TABLE Student(
	--INDENTITY auto fills the column with values strating from 1 with increment of 1 for each subsequent row. 
	id INT IDENTITY PRIMARY KEY,
	name VARCHAR(25),
	age INT,
	fee MONEY
);

INSERT INTO Student (name, age, fee) VALUES
('Ajeet', 27, 20000),
('Backon', 29, 28000),
('Chris', 18, 18000),
('Kimmi', 21, 45000),
('Nippun', 24, 55000),
('Prabhakar', 28, 65000),
('John', 32, 15000),
('Lily', 18, 24000),
('Lucy', 16, 72000);

SELECT * FROM Student;

--Virtual table is called as views.

CREATE VIEW Student_view AS
SELECT id, name, fee
FROM Student
WHERE id > 3;

SELECT * FROM Student_view;

ALTER VIEW Student_view AS
SELECT id, name, fee, age
FROM Student
WHERE id > 3;

DROP VIEW Student_view;