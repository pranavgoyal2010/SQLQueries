--Data Definition Language
--DDL is used to define the structure and schema of the database. These commands changes the structure of the database
--These commands include CREATE, ALTER, DROP, TRUNCATE.


--Data Manipulation Language
--These commands are used to change the actual data inside the database. They do not change the structure of the database. 
--It includes commands such as INSERT, UPDATE, DELETE, etc.


--Below code generates a table Customer with required column names and data types

CREATE TABLE Customers(
	CustomerID INT,
	Name VARCHAR(50),
	Email VARCHAR(50),
	Phone VARCHAR(50),
	Address VARCHAR(50),
	OrderID INT,
	OrderDate DATE
);

SELECT * FROM Customers;

INSERT INTO Customers (CustomerID, Name, Email, Phone, Address, OrderID, OrderDate) VALUES
(1, 'John Smith', 'john@example.com', '1234567890', '123 Main St', 1, '2023-05-15'),
(2, 'Jane Doe', 'jane@example.com', '9876543210', '456 Elm St', 1, '2023-05-15'),
(3, 'Mike Johnson', 'mike@example.com', '5551234567', '789 Oak St', 2, '2023-05-20'),
(4, 'Emily Brown', 'emily@example.com', '2223334444', '321 Pine St', 3, '2023-05-25');



ALTER TABLE Customers 
ADD OrderID INT DEFAULT 0, OrderDate Date DEFAULT GETDATE();

--Before I just had 5 columns but using ALTER I added 2 more columns.
--Below code tried adding additional 4 rows to the Customers table making the total rows count as 8.

INSERT INTO Customers (OrderID, OrderDate) VALUES
(1, '2023-05-15'),
(1, '2023-05-15'),
(2, '2023-05-20'),
(3, '2023-05-25');

DELETE FROM Customers WHERE OrderID IS NOT NULL;

ALTER TABLE Customers DROP COLUMN OrderID;

ALTER TABLE Customers DROP COLUMN OrderDate;

TRUNCATE TABLE Customers;

DROP TABLE Customers;

ALTER TABLE Customers
ALTER COLUMN CustomerID INT NOT NULL;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
    Item VARCHAR(50),
    Quantity INT,
    Price INT,
    CustomerID INT FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

SELECT * FROM Orders;

INSERT INTO Orders VALUES 
(1, 'Widget', 5, 10, 1),     
(2, 'Gadget', 3, 15, 2),      
(3, 'Tool', 2, 20, 3),        
(4, 'Accessory', 1, 8, 4);

INSERT INTO Orders VALUES
(5, 'Accessory', 1, 8, NULL);

DELETE FROM Orders WHERE CustomerID IS NULL;

ALTER TABLE Orders DROP CONSTRAINT FK__Orders__Customer__48CFD27E;

ALTER TABLE Orders ADD CONSTRAINT FK_1 FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Customers
DROP COLUMN OrderDate;

SELECT * FROM Customers;

ALTER TABLE Customers
ADD OrderDate DATE DEFAULT GETDATE();

ALTER TABLE Customers 
DROP CONSTRAINT [DF__Customers__Order__4AB81AF0];

INSERT INTO Customers (CustomerID, Name, Email, Phone, Address, OrderID) VALUES
(5, 'Alice Bob', 'alice@example.com', 1234567899, '123 Smith St', 2);



--REFERENTIAL INTEGRITY
--Suppose you have two tables. First table has a column declared as primary key. Second table has a column declared as foreign key
--and this column is referenced by the primary key in first table. Now if suppose you try to delete a row from first table it will
--give error as the primary key is used as foreign key in second table. Hence to overcome this error we use the following

/*This will delete or update entry in primary key and foreign key table*/
--on update cascade
--on delete cascade

/*this will delete or update entry in primary key table and replace the value with null in foreign key table*/
--on delete set null
--on update set null

/*same thing happens for set DEAFULT and set */