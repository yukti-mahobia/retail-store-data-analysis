USE retail_store;

-- LEVEL 4: MULTI-TABLE QUERIES (JOIN)

-- 1. Retrieve order details along with the customer name (INNER JOIN)
SELECT
    O.order_id,
    O.order_date,
    O.total_amount,
    O.status,
    C.name
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id;

-- 2. Get list of products that have been sold (INNER JOIN with order_items)
SELECT
    P.product_id,
    P.name,
    P.category,
    OI.order_id,
    OI.order_item_id
FROM products P
INNER JOIN order_items OI
ON P.product_id = OI.product_id;

-- 3. List all orders with their payment method (INNER JOIN)
SELECT
	O.order_id,
	P.method
FROM orders O
INNER JOIN payments P
ON O.order_id = P.order_id;

-- 4. Get list of customers and their orders (LEFT JOIN)
SELECT
    C.customer_id,
    C.name,
    O.order_id
FROM customers C
LEFT JOIN orders O
ON C.customer_id = O.customer_id;

-- 5. List all products along with order item quantity (LEFT JOIN)
SELECT
    P.product_id,
    P.name,
    OI.quantity
FROM products P
LEFT JOIN order_items OI
ON P.product_id = OI.product_id;

-- 6. List all payments including those with no matching orders (RIGHT JOIN)
SELECT
    O.order_id,
    PT.payment_id,
    PT.method,
    PT.amount_paid
FROM orders O
RIGHT JOIN payments PT
ON O.order_id = PT.order_id;

-- 7. Combine data from three tables: customer, order, and payment
SELECT 
	C.customer_id, C.name, C.email, C.phone, C.created_at,
    O.order_id, O.order_date, O.status, O.total_amount,
    P.payment_id, P.payment_date, P.method, P.amount_paid
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
INNER JOIN payments P
ON O.order_id = P.order_id;