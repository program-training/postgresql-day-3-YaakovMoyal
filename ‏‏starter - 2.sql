-- Active: 1694601270164@@127.0.0.1@8200@northwind@public

SELECT customer_id FROM customers
GROUP BY customer_id

SELECT customer_id FROM orders
GROUP BY customer_id

-- 1
SELECT contact_name
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL;


-- 2
SELECT contact_name, COUNT(orders.order_id) FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING 10 < COUNT(orders.order_id)

-- 3
SELECT product_name, unit_price FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)

-- 4
SELECT product_name 
FROM products
INNER JOIN order_details
ON order_details.product_id IS NULL
GROUP BY product_name

-- 5
SELECT country, COUNT(contact_name) FROM customers
GROUP BY country
HAVING COUNT(contact_name) >= 5

-- 6
SELECT contact_name
-- , order_date
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE (EXTRACT(YEAR FROM orders.order_date)) <> 1998
GROUP BY contact_name
-- , order_date
ORDER BY contact_name


SELECT customer_id
FROM orders
WHERE (EXTRACT(YEAR FROM orders.order_date)) <> 1998
GROUP BY customer_id
ORDER BY customer_id

-- 7
SELECT contact_name
-- , country, order_date
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country IN ('Germany') AND (EXTRACT(YEAR FROM orders.order_date)) <> 1998
GROUP BY contact_name
-- , country, order_date
ORDER BY contact_name

-- 8
SELECT contact_name, COUNT(orders.order_id) FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING COUNT(orders.order_id) = 3


-- 9
???????????????


-- 10
SELECT ship_Country FROM orders
.........