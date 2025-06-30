-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Customers
INSERT INTO Customers VALUES
(1, 'Arun', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Sameer', 'Chennai');

-- Insert data into Orders
INSERT INTO Orders VALUES
(101, 1, 'Laptop'),
(102, 1, 'Mouse'),
(103, 2, 'Keyboard'),
(104, 4, 'Monitor'); -- Nonexistent customer

-- INNER JOIN: only matching customers and orders
SELECT c.name, o.product
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN: all customers, matched or not
SELECT c.name, o.product
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN (for MySQL): all orders, matched or not
SELECT c.name, o.product
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- FULL JOIN: simulate with UNION (if not supported)
SELECT c.name, o.product
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.name, o.product
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;