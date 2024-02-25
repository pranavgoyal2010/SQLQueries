CREATE TABLE ProductQty (
    Id INT PRIMARY KEY,
    Region VARCHAR(50),
    Product VARCHAR(50),
    Year INT,
    Quantity INT,
    Price INT
);

DELETE FROM ProductQty;

INSERT INTO ProductQty (Id, Region, Product, Year, Quantity, Price)
VALUES
(1, 'East', 'Computer', 2020, 130, 50000),
(2, 'South', 'Computer', 2020, 450, 35000),
(3, 'North', 'Computer', 2020, 250, 40000),
(4, 'East', 'Hard Disk', 2020, 190, 5500),
(5, 'West', 'Computer', 2021, 250, 45000),
(6, 'South', 'Hard Disk', 2021, 550, 4400),
(7, 'West', 'Hard Disk', 2021, 650, 7500),
(8, 'East', 'Pen Drive', 2021, 120, 800),
(9, 'North', 'Mouse', 2019, 160, 1500),
(10, 'South', 'Pen Drive', 2019, 270, 750),
(11, 'East', 'Mouse', 2019, 2000, 1200),
(12, 'West', 'Pen Drive', 2019, 190, 650);

SELECT * FROM ProductQty;




---MIN() FUNCTION

SELECT MIN(Quantity) AS "Minimum Quantity" FROM ProductQty;  

SELECT Product, Quantity, Price  
FROM ProductQty  
WHERE Quantity = (  
SELECT MIN(Quantity) AS "Minimum Quantity"   
FROM ProductQty);

SELECT Product, MIN(Quantity) AS "Minimum Quantity"   
FROM ProductQty  
GROUP BY Product;  

SELECT Product, MIN(Quantity) AS "Minimum Quantity"   
FROM ProductQty  
GROUP BY Product  
HAVING MIN(Quantity)>100;  

SELECT Product, MIN( DISTINCT Quantity) AS "Minimum Quantity"   
FROM ProductQty  
GROUP BY Product;  



--MAX() FUNCTION

SELECT MAX(Quantity) AS "Maximum Quantity" FROM ProductQty; 

SELECT Product, Quantity, Price  
FROM ProductQty  
WHERE Quantity = (  
SELECT MAX(Quantity) AS "Maximum Quantity"   
FROM ProductQty);

SELECT Product, MAX(Quantity) AS "Maximum Quantity"   
FROM ProductQty  
GROUP BY Product  
ORDER BY Product; 

SELECT Product, MAX(Quantity * Price) AS "Highest Value"   
FROM ProductQty  
GROUP BY Product;



--SUM() FUNCTION

SELECT SUM(Quantity) AS "total quantity" FROM ProductQty;

SELECT DISTINCT Quantity AS "total quantity" FROM ProductQty;

SELECT SUM(DISTINCT Quantity) AS "total quantity" FROM ProductQty;

SELECT SUM(Quantity) AS 'Total Quantity For 2020' FROM ProductQty WHERE Year=2020;

SELECT Year, SUM(Quantity) AS 'Year wise total' FROM ProductQty GROUP BY Year;

SELECT Year, SUM(Quantity) AS 'Year wise total' FROM ProductQty 
GROUP BY Year HAVING SUM(Quantity) > 1500
ORDER BY 'Year wise total';


--AVG() FUNCTION
SELECT AVG(Quantity) AS "Avg Qty" FROM ProductQty;

SELECT AVG(Quantity) AS 'Avg Quantity For 2020' FROM ProductQty WHERE Year=2020;

SELECT Year, AVG(Quantity) AS 'Year wise average' FROM ProductQty GROUP BY Year;

--COUNT() FUNCTION
SELECT COUNT(DISTINCT Product) AS 'Types of Products' FROM ProductQty;


