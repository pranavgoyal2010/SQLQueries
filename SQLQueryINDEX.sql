
----REFERE THIS WEBSITE https://www.sqlservertutorial.net/sql-server-indexes/

SELECT * FROM Student;

--Altered table to drop the primary key constraint on id
ALTER TABLE Student
DROP CONSTRAINT [PK__Student__3213E83F26C9942A];

--normal way to list all rows having age > 20. This will visit each and every row and check if the condition is satisfied or not
SELECT * FROM Student WHERE age>20;

--another way to do this is by using index. 
--An index is one of the important paths to make the performance of SQL Server database high. It makes the querying process fast
--An index should not be used when a table is small.

--This creates a Non-Clustered index where the sorted column is stored in another table and the this new table refers to the original table.
CREATE INDEX index_age ON Student(age);

--Non clustered index is created by default.

--to disable index following command is used
ALTER INDEX index_age ON Student DISABLE;


--to enable the index following command is used
ALTER INDEX index_age ON Student REBUILD;

--To remove an index following command is used 
DROP INDEX index_age ON Student;



----------CREATING CLUSTERED INDEX-------------------------

CREATE TABLE production_parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);


--Clustered index causes records to be physically stored in a sorted or sequential order.
--When I add the below records the table is automatically sorts the records based on the clustered index and the same table is modified
--It does not create a separate table.
INSERT INTO production_parts(part_id, part_name) VALUES (1,'Frame');
INSERT INTO production_parts(part_id, part_name) VALUES (2,'Head Tube');
INSERT INTO production_parts(part_id, part_name) VALUES (3,'Handlebar Grip');
INSERT INTO production_parts(part_id, part_name) VALUES (4,'Shock Absorber');
INSERT INTO production_parts(part_id, part_name) VALUES (5,'Fork');

CREATE TABLE production_part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);

--PRIMARY KEY IS Clustered Index by default

--There can be multiple non Clustered Indexes in a table. 
--Only one clustered Index for the entire table

--Added contraint for to make parts_id as primary key 
ALTER TABLE production_parts
ADD PRIMARY KEY(part_id);


--This statement gives error as it cannot create another clustered index on production_parts table
--So we need to drop the primary key i.e. the previous clustered index so that we can create another clustered index.
CREATE CLUSTERED INDEX ix_parts_id
ON production_parts (part_id);  

--Dropping the primary key constraint 
ALTER TABLE production_parts
DROP CONSTRAINT [PK__producti__A0E3FAB8C22D514E]

SELECT * FROM production_parts;