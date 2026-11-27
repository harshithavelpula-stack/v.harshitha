CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);
INSERT INTO customers VALUES 
(1, 'Alice Smith', 'USA'),
(2, 'Bob Jones', 'Canada'),
(3, 'Charlie Brown', 'UK'),
(4, 'Diana Prince', 'USA');
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products VALUES 
(101, 'Laptop', 1200.00),
(102, 'Smartphone', 800.00),
(103, 'Wireless Headphones', 150.00),
(104, 'Tablet', 400.00);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE
);
INSERT INTO orders VALUES 
(5001, 1, 101, '2026-06-01'),
(5002, 2, 102, '2026-06-02'),
(5003, 1, 103, '2026-06-03'),
(5004, NULL, 101, '2026-06-04');

--INNER JOIN excludes guest checkouts and unrecorded products,returning only matched orders.
SELECT O.order_id,c.customer_name,p.product_name
FROM orders o
INNER JOIN customers c
ON o.customer_id=c.customer_id
INNER JOIN products p
ON o.product_id=p.product_id;

--LEFT JOIN keeps all registered customerseven if they have not placed any orders.
SELECT c.customer_name,o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id=o.customer_id;

--RIGHT JOIN includes all products even if thry have never been ordered by any customer.
SELECT p.product_name,o.order_id
FROM products p
RIGHT JOIN orders o
ON p.product_id=o.product_id;

--FULL OUTER JOIN retrives all records from both tables, showing unmatched customers and guest checkots.
SELECT c.customer_name,o.order_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id=o.order_id;

--CROSS JOIN genrates a cartesian product combining every customer withh every product without conditions.
SELECT c.customer_name,product_name
FROM customers c
CROSS JOIN products;

SELECT COUNT(*)
FROM customers
CROSS JOIN products;
