-- PROJECT DOCUMENTATION AND ANALYSIS CAN BE FOUND HERE: https://docs.google.com/document/d/1PKEfzM_rNsfC3L7TUhl6Pswj8Mqv2OafsbrSRJfcyiI/edit?tab=t.0#heading=h.8q0yxbyz76q0
--CREATING DATABASE 'GETIT'
CREATE DATABASE GetIt;

--CREATING TABLES FOR DATABASE
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number NUMERIC(11) NOT NULL,
    address VARCHAR(100) NOT NULL);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity NUMERIC( 5));

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES Customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL);

CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES Orders(order_id),
    product_id INTEGER NOT NULL REFERENCES Products(product_id),
    quantity INTEGER NOT NULL,
    price NUMERIC(10, 2) NOT NULL);

--INSERTING DATA INTO TABLES CREATED
INSERT INTO Customers (name, email, phone_number, address) VALUES
('Chinedu Obi', 'chinedu.obi@example.com', 09076543210, '12 Victoria Island, Lagos'),
('Aisha Bello', 'aisha.bello@example.com', 09098765432, '5 Garki Close, Abuja'),
('Temi Olatunji', 'temi.olatunji@example.com', 08134567891, '9 Ikoyi Crescent, Lagos'),
('Emeka Okonkwo', 'emeka.okonkwo@example.com', 08056789123, '23 Maitama Avenue, Abuja'),
('Ngozi Uche', 'ngozi.uche@example.com', 08067891234, '16 Lekki Phase 1, Lagos'),
('Yemi Adeoye', 'yemi.adeoye@example.com', 08145678902, '44 Wuse II, Abuja'),
('Bola Amadi', 'bola.amadi@example.com', 08156789012, '11 Alausa, Ikeja'),
('Kemi Abiola', 'kemi.abiola@example.com', 08167890123, '8 Dolphin Estate, Lagos'),
('Funke Bakare', 'funke.bakare@example.com', 08178901234, '15 Asokoro, Abuja'),
('Segun Oladipo', 'segun.oladipo@example.com', 08189012345, '29 Apapa Road, Lagos'),
('Gbenga Ajayi', 'gbenga.ajayi@example.com', 08190123456, '7 Jabi District, Abuja'),
('Ifeoma Nwosu', 'ifeoma.nwosu@example.com', 08201234567, '3 Yaba, Lagos'),
('Sade Adebayo', 'sade.adebayo@example.com', 08212345678, '14 Jikwoyi, Abuja'),
('Oluwaseun Akinola', 'oluwaseun.akinola@example.com', 08223456789, '1 Marina, Lagos'),
('Musa Abdullahi', 'musa.abdullahi@example.com', 08234567890, '17 Gwarinpa, Abuja'),
('Amaka Eze', 'amaka.eze@example.com', 08245678901, '6 Surulere, Lagos'),
('Tunde Fashola', 'tunde.fashola@example.com', 08256789012, '22 Lugbe, Abuja'),
('Adaobi Okeke', 'adaobi.okeke@example.com', 08267890123, '30 Ajah, Lagos'),
('David Adeola', 'david.adeola@example.com', 08278901234, '25 Kubwa, Abuja'),
('Nkechi Onwubiko', 'nkechi.onwubiko@example.com', 08289012345, '4 Festac Town, Lagos');

INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 250000.00, 15),
('Smartphone', 'Electronics', 120000.00, 50),
('Headphones', 'Electronics', 8000.00, 75),
('Microwave', 'Home Appliances', 45000.00, 30),
('Refrigerator', 'Home Appliances', 150000.00, 20),
('Electric Kettle', 'Home Appliances', 7000.00, 40),
('Wristwatch', 'Accessories', 10000.00, 100),
('Sunglasses', 'Accessories', 5000.00, 200),
('Backpack', 'Accessories', 8000.00, 150),
('Notebook', 'Stationery', 1500.00, 300),
('Pen', 'Stationery', 200.00, 500),
('Desk Lamp', 'Home Decor', 3000.00, 50),
('Wall Clock', 'Home Decor', 2500.00, 70),
('Television', 'Electronics', 90000.00, 25),
('Blender', 'Home Appliances', 15000.00, 35),
('Toaster', 'Home Appliances', 5000.00, 45),
('Tablet', 'Electronics', 70000.00, 40),
('Gaming Console', 'Electronics', 150000.00, 20),
('Printer', 'Electronics', 45000.00, 30),
('Camera', 'Electronics', 85000.00, 25);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-12-01 10:00:00', 25000.00),
(2, '2024-12-02 12:30:00', 40000.00),
(3, '2024-12-03 14:45:00', 15000.00),
(4, '2024-12-04 09:15:00', 70000.00),
(5, '2024-12-05 11:20:00', 32000.00),
(6, '2024-12-06 16:00:00', 29000.00),
(7, '2024-12-07 13:25:00', 18000.00),
(8, '2024-12-08 17:45:00', 50000.00),
(9, '2024-12-09 08:50:00', 22000.00),
(10, '2024-12-10 15:35:00', 62000.00),
(11, '2024-12-11 10:10:00', 33000.00),
(12, '2024-12-12 12:55:00', 41000.00),
(13, '2024-12-13 14:05:00', 55000.00),
(14, '2024-12-14 09:30:00', 37000.00),
(15, '2024-12-15 11:45:00', 44000.00),
(16, '2024-12-16 13:50:00', 65000.00),
(17, '2024-12-17 16:15:00', 28000.00),
(18, '2024-12-18 08:20:00', 39000.00),
(19, '2024-12-19 10:40:00', 47000.00),
(20, '2024-12-20 14:25:00', 36000.00),
(1, '2024-12-21 09:55:00', 33000.00),
(2, '2024-12-22 11:30:00', 41000.00),
(3, '2024-12-23 13:10:00', 55000.00),
(4, '2024-12-24 15:00:00', 37000.00),
(5, '2024-12-25 16:35:00', 44000.00),
(6, '2024-12-26 08:45:00', 65000.00),
(7, '2024-12-27 10:20:00', 28000.00),
(8, '2024-12-28 12:05:00', 39000.00),
(9, '2024-12-29 13:50:00', 47000.00),
(10, '2024-12-30 15:30:00', 36000.00);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 500000.00),
(1, 2, 1, 120000.00),
(2, 3, 1, 8000.00),
(2, 4, 1, 45000.00),
(3, 5, 1, 150000.00),
(3, 6, 1, 7000.00),
(4, 7, 2, 20000.00),
(4, 8, 3, 15000.00),
(5, 9, 1, 8000.00),
(5, 10, 10, 15000.00),
(6, 11, 50, 10000.00),
(6, 12, 5, 15000.00),
(7, 13, 3, 7500.00),
(7, 14, 2, 18000.00),
(8, 15, 1, 4500.00),
(8, 16, 1, 15000.00),
(9, 17, 2, 14000.00),
(9, 18, 1, 30000.00),
(10, 19, 1, 30000.00),
(10, 20, 2, 170000.00),
(11, 1, 1, 250000.00),
(12, 2, 2, 240000.00),
(13, 3, 3, 24000.00),
(14, 4, 1, 45000.00),
(15, 5, 1, 150000.00),
(16, 6, 1, 7000.00),
(17, 7, 1, 10000.00),
(18, 8, 2, 10000.00),
(19, 9, 5, 40000.00),
(20, 10, 10, 15000.00),
(21, 11, 1, 250.00),
(22, 12, 2, 6000.00),
(23, 13, 2, 5000.00),
(24, 14, 2, 180000.00),
(25, 15, 1, 4500.00),
(26, 16, 2, 15000.00),
(27, 17, 1, 70000.00),
(28, 18, 1, 150000.00),
(29, 19, 1, 45000.00),
(30, 20, 2, 170000.00);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_items;


---ADDING NEW DATA TO DATABASE
INSERT INTO Customers (name, email, phone_number, address) VALUES
('Olumide Johnson', 'olumide.johnson@example.com', 09081234567, '10 Agidingbi, Ikeja'),
('Fatima Yusuf', 'fatima.yusuf@example.com', 08098765432, '15 Kado Estate, Abuja'),
('Chima Anozie', 'chima.anozie@example.com', 08123456789, '18 Trans-Amadi, Port Harcourt');


--UPDATING STOCK ON DATABASE
UPDATE Products
SET stock_quantity = stock_quantity - (SELECT SUM(quantity) FROM Order_Items WHERE product_id = Products.product_id AND order_id IN (SELECT order_id FROM Orders WHERE order_date > '2024-12-01'))
WHERE product_id IN (SELECT product_id FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders WHERE order_date > '2024-12-01'));

--DELETING AN ORDER FROM DATABASE
DELETE FROM Order_Items
WHERE order_id = 1;

SELECT * FROM Order_items;


--Retrieve all orders made by a specific customer.
SELECT o.order_id, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Ngozi Uche';

--Total Revenue
SELECT SUM(total_amount) as total_revenue
FROM Orders;

--Product revenue
select p.product_name, SUM(oi.price) AS total_revenue
FROM Order_items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

--Total Spent
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

--Customers without purchase
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total_amount) = 0;

--Top 3 best-selling products
SELECT p.product_name, p.product_id, sum(oi.quantity) AS product_order
FROM Products p
JOIN Order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, p.product_id
order by product_order desc
limit 3;

--Out of stock
SELECT product_name, stock_quantity AS out_of_stock
FROM Products
where stock_quantity = 0;

--All products
select p.product_name, p.product_id, oi.quantity, oi.price
FROM Products p
JOIN Order_items oi ON p.product_id = oi.product_id
order by price;

--Calculate the total amount of an order.
select * from order_items;
--calling this query displays all orders made, the price column already has the total amount of each order made.

--Number of orders for each month
SELECT DATE_TRUNC('month', order_date) AS month, 
    COUNT(order_id) AS number_of_orders,
	SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY month;


--Queries using INNER JOIN, LEFT JOIN, and FULL JOIN to retrieve data across multiple tables.
select c.name AS customer_name, o.order_id, oi.product_id, p.product_name, oi.quantity, oi.price
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id;

select c.name AS customer_name, o.order_id, o.order_date, o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name AS customer_name, o.order_id, o.order_date, o.total_amount
FROM Customers c
FULL JOIN Orders o ON c.customer_id = o.customer_id;

--Rank customers based on their total spending
SELECT c.name, SUM(o.total_amount) AS total_spent,
	rank() over (partition by c.name order by SUM(o.total_amount) desc) rank
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

--ROW_NUMBER() to assign a unique number to each order for a customer
SELECT c.name AS customer_name, o.order_id, oi.product_id, p.product_name, oi.quantity, oi.price,
    ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY o.order_id) AS row_number
FROM Customers c
INNER JOIN Orders o ON o.customer_id = c.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id;

--Use a Common Table Expression (CTE) to calculate the total revenue per customer, then find the customers with revenue greater than $500.
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id, 
        c.name, 
        SUM(o.total_amount) AS total_revenue
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
)
SELECT 
    customer_id, 
    name, 
    total_revenue
FROM CustomerRevenue
WHERE total_revenue > 500;

--Product with the highest price.
SELECT product_name, product_id, price
FROM Products
GROUP BY product_name, product_id
order by price desc
limit 1
;

--INDEXING
CREATE INDEX idx_product_id ON Order_Items(product_id);
CREATE INDEX idx_order_id ON Order_Items(order_id);
CREATE INDEX idx_customer_id ON Customers(customer_id);
EXPLAIN ANALYZE
SELECT * FROM Order_Items
WHERE product_id = 1;
EXPLAIN ANALYZE
SELECT * FROM Customers
WHERE customer_id = 1;

--EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;
