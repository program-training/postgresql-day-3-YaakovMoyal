SELECT * FROM products


-- Active: 1694601270164@@127.0.0.1@8200@northwind@public
-- 1
SELECT employees.first_name || ' ' || employees.last_name AS employee, COUNT(orders.order_ID)
FROM employees  INNER JOIN orders 
ON employees.employee_id = orders.employee_id
GROUP BY employees.employee_id;

-- 2
SELECT categories.category_name, sum((order_details.unit_price * order_details.quantity) * (1 - discount))
FROM order_details INNER JOIN products
ON order_details.product_id = products.product_id
INNER JOIN categories
ON categories.category_id = products.category_id
GROUP BY category_name;

-- 3
SELECT contact_name, AVG((order_details.unit_price * order_details.quantity) * (1 - discount)) AS avg_sum
FROM orders INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY contact_name
-- , orders.order_id
-- ORDER BY Orders.order_id DESC;
ORDER BY avg_sum DESC;

-- 4
SELECT contact_name, sum((order_details.unit_price * order_details.quantity) * (1 - discount)) AS total_sum
FROM orders INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY contact_name
ORDER BY total_sum DESC LIMIT 10;

-- 5
SELECT EXTRACT(MONTH FROM orders.order_date) AS month_num
, sum((order_details.unit_price * order_details.quantity) * (1 - discount)) AS total
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY month_num
ORDER BY month_num;

-- 6
SELECT  product_name, units_in_stock
FROM products
WHERE units_in_stock < 10;

-- 7
SELECT contact_name, max(((order_details.unit_price * order_details.quantity) * (1 - discount))) AS big
FROM orders INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY contact_name
ORDER BY big DESC
LIMIT 1

-- 8
SELECT ship_country AS country, sum((order_details.unit_price * order_details.quantity) * (1 - discount)) AS total_revenue
FROM orders INNER JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY country 
ORDER BY total_revenue DESC;


-- 9
SELECT shipper_ID, count(ship_via) as total
FROM shippers INNER JOIN orders
ON shippers.shipper_id = orders.ship_via
GROUP BY shipper_ID
ORDER BY total DESC;

-- 10
SELECT product_name 
FROM products
INNER JOIN order_details
ON order_details.product_id IS NULL
GROUP BY product_name



