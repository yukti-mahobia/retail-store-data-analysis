USE retail_store;

-- LEVEL 2: FILTERING AND FORMATTING

-- 1. Retrieve orders where customer information is missing (possibly due to data migration ordeletion)
SELECT *
FROM orders
WHERE customer_id IS NULL;

-- 2. Display customer names and emails using column aliases for frontend readability
SELECT
name AS 'Customer Name',
email AS 'Email Address'
FROM customers;

-- 3. Calculate total value per item ordered by multiplying quantity and item price
SELECT
    order_item_id,
    quantity,
    item_price,
    quantity * item_price AS total_value
FROM order_items;

-- 4. Combine customer name and phone number in a single column
SELECT
    CONCAT(name, ' - ', phone) AS customer_contacts
FROM customers;

-- 5. Extract only the date part from order timestamps for date-wise reporting
SELECT DATE(order_date) AS order_date
FROM orders;

-- 6. List products that do not have any stock left
SELECT *
FROM products
WHERE stock_quantity = 0;