USE retail_store;

-- LEVEL 3: AGGREGATIONS

-- 1. Count the total number of orders placed
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. Calculate the total revenue collected from all orders
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- 3. Calculate the average order value
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- 4. Count the number of customers who have placed at least one order
SELECT COUNT(DISTINCT customer_id) AS active_customers
FROM orders;

-- 5. Find the number of orders placed by each customer
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- 6. Find total sales amount made by each customer
SELECT customer_id,
       SUM(total_amount) AS total_sales
FROM orders
GROUP BY customer_id;

-- 7. List the number of products sold per category
SELECT p.category,
       COUNT(oi.product_id) AS products_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category;

-- 8. Find the average item price per category
SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category;

-- 9. Show number of orders placed per day
SELECT DATE(order_date) AS order_date,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATE(order_date);

-- 10. List total payments received per payment method
SELECT method,
       SUM(amount_paid) AS total_payments
FROM payments
GROUP BY method;
