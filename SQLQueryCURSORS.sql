--=========================SQL Cursor==========================

CREATE TABLE Employee1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    JoiningDate DATE
);


INSERT INTO Employee1 (ID, Name, JoiningDate)
VALUES
    (1, 'John Doe', '2023-01-15'),
    (2, 'Jane Smith', '2022-05-20'),
    (3, 'Alice Johnson', '2021-11-10'),
    (4, 'Bob Brown', '2020-09-25'),
    (5, 'Emily Davis', '2019-04-30'),
    (6, 'Michael Wilson', '2018-08-12'),
    (7, 'Emma Martinez', '2017-03-05'),
    (8, 'William Anderson', '2016-06-18'),
    (9, 'Olivia Taylor', '2015-10-22'),
    (10, 'James Garcia', '2014-12-08');



	
SELECT * FROM Employee1

DELETE FROM Employee1 WHERE ID = 9;

--NOW START DEFINING CURSER 

--STEP1

DECLARE MyCursor CURSOR SCROLL FOR SELECT * FROM Employee1

--STEP2
OPEN MyCursor

--STEP3
FETCH FIRST FROM MyCursor
FETCH NEXT FROM MyCursor
FETCH LAST FROM MyCursor

FETCH PRIOR FROM MyCursor

FETCH ABSOLUTE 7 FROM MyCursor

FETCH RELATIVE 2 FROM MyCursor

FETCH RELATIVE -5 FROM MyCursor
--STEP4
CLOSE MyCursor

--STEP5
Deallocate  MyCursor



--