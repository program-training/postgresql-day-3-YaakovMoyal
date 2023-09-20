-- Active: 1694601270164@@127.0.0.1@8200@northwind@public

SELECT customer_id FROM customers
GROUP BY customer_id

SELECT customer_id FROM orders
GROUP BY customer_id


-- 1
SELECT contact_name
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL
GROUP BY contact_name

-- 2
SELECT contact_name, COUNT(orders.order_id) FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING COUNT(orders.order_id) > 10

-- 3
SELECT product_name, unit_price FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)

-- 4
SELECT product_name
FROM products
LEFT OUTER JOIN order_details
ON products.product_id = order_details.product_id
WHERE order_details.product_id IS NULL
GROUP BY product_name

-- 5
SELECT country, COUNT(country) FROM customers
GROUP BY country
HAVING COUNT(contact_name) >= 5

-- 6
SELECT customer_id, contact_name FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders
WHERE (EXTRACT(YEAR FROM orders.order_date)) = 1998)

-- 7
SELECT contact_name FROM customers
WHERE country IN ('Germany')
AND customer_id NOT IN (SELECT customer_id FROM orders
WHERE (EXTRACT(YEAR FROM orders.order_date)) = 1998)


-- 8
SELECT contact_name, COUNT(orders.order_id) FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING COUNT(orders.order_id) = 3


-- 9
???????????????


-- 10
SELECT suppliers.supplier_id, company_name, COUNT(order_details.product_id),suppliers.country 
FROM suppliers
INNER JOIN products
ON suppliers.supplier_id = products.supplier_id
INNER JOIN order_details
ON products.product_id = order_details.product_id
GROUP BY suppliers.supplier_id,company_name,suppliers.country
HAVING suppliers.country LIKE 'USA'
-- AND COUNT(order_details.product_id) > 0
