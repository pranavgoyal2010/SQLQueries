SELECT * FROM Student;

--Altered table to drop the primary key constraint on id
ALTER TABLE Student
DROP CONSTRAINT [PK__Student__3213E83F26C9942A];

--normal way to list all rows having age > 20. This will visit each and every row and check if the condition is satisfied or not
SELECT * FROM Student WHERE age>20;

--another way to do this is by using index. 
--An index is one of the important paths to make the performance of SQL Server database high. It makes the querying process fast
--An index should not be used when a table is small.

CREATE INDEX index_age ON Student(age);

--to disable index following command is used
ALTER INDEX index_age ON Student DISABLE;


--to enable the index following command is used
ALTER INDEX index_age ON Student REBUILD;

--To remove an index following command is used 
DROP INDEX index_age ON Student;