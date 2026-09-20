USE retail_store;

-- LEVEL 6: SET OPERATIONS

-- 1. List all customers who have either placed an order or written a product review
SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    UNION
    SELECT customer_id
    FROM product_reviews
);

-- 2. List all customers who have placed an order as well as reviewed a product [intersect notsupported]

-- Version 1: INTERSECT not supported
SELECT DISTINCT
    C.*
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
INNER JOIN product_reviews PR
ON C.customer_id = PR.customer_id;

-- Version 2: INTERSECT supported by Databases
SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    INTERSECT
    SELECT customer_id
    FROM product_reviews
);