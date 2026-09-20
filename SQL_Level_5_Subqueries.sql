USE retail_store;

-- LEVEL 5: SUBQUERIES (INNER QUERIES)

-- 1. List all products priced above the average product price
SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

-- 2. Find customers who have placed at least one order
SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT DISTINCT customer_id
    FROM orders
);
  
  
-- 3. Show orders whose total amount is above the average for that customer
SELECT *
FROM orders O
WHERE total_amount >
(
    SELECT AVG(total_amount)
    FROM orders
    WHERE customer_id = O.customer_id
);

-- 4. Display customers who haven’t placed any orders
SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT DISTINCT customer_id
    FROM orders
);

-- 5. Show products that were never ordered
SELECT *
FROM products
WHERE product_id NOT IN
(
    SELECT DISTINCT product_id
    FROM order_items
);

-- 6. Show highest value order per customer
SELECT *
FROM orders O
WHERE total_amount =
(
    SELECT MAX(total_amount)
    FROM orders
    WHERE customer_id = O.customer_id
);

-- 7. Highest Order Per Customer (Including Names)
SELECT
    C.customer_id, C.name,
    O.order_id, O.total_amount
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
WHERE O.total_amount =
(SELECT MAX(total_amount)
    FROM orders
    WHERE customer_id = O.customer_id);
    