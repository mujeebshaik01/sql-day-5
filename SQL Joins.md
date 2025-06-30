SQL Joins Practice - README
Overview
This repository contains SQL examples demonstrating different types of joins between database tables. The examples cover INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN operations using sample Customer and Order tables.

Table Structure
The database contains two related tables:

Customers Table
CustomerID (INT, PRIMARY KEY)

CustomerName (VARCHAR)

ContactName (VARCHAR)

Country (VARCHAR)

Orders Table
OrderID (INT, PRIMARY KEY)

CustomerID (INT, FOREIGN KEY)

OrderDate (DATE)

Amount (DECIMAL)

SQL Join Examples
1. INNER JOIN
sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
2. LEFT JOIN
sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
3. RIGHT JOIN
sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
4. FULL JOIN
sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
Database Setup
To set up the sample database:

Create the tables:

sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
Insert sample data:

sql
INSERT INTO Customers VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden');

INSERT INTO Orders VALUES
(10308, 2, '2023-09-18', 88.80),
(10309, 3, '2023-09-19', 117.45),
(10310, 4, '2023-09-20', 252.50),
(10311, 5, '2023-09-21', 75.60),
(10312, 1, '2023-09-22', 320.75),
(10313, 2, '2023-09-23', 55.20),
(10314, NULL, '2023-09-24', 180.00);
Notes
SQLite doesn't natively support RIGHT JOIN and FULL JOIN. The repository includes alternative implementations for these joins.

The examples are compatible with most SQL databases including MySQL, PostgreSQL, and SQL Server (with minor syntax adjustments if needed).

Expected Results
Each join type produces different result sets:

INNER JOIN: Only matching records

LEFT JOIN: All customers with their orders (if any)

RIGHT JOIN: All orders with their customers (if any)

FULL JOIN: All records from both tables


