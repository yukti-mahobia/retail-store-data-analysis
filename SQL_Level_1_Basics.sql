USE retail_store;

-- LEVEL 1: BASICS

-- 1. Retrieve customer names and emails for email marketing
SELECT name, email
FROM customers;

-- 2. View complete product catalog with all available details
SELECT *
FROM products;

-- 3. List all unique product categories
SELECT DISTINCT category
FROM products;

-- 4. Show all products priced above ₹1,000
SELECT *
FROM products
WHERE price > 1000;

-- 5. Display products within a mid-range price bracket (₹2,000 to ₹5,000)
SELECT *
FROM products
WHERE price BETWEEN 2000 AND 5000;

-- 6. Fetch data for specific customer IDs (e.g., from loyalty program list)
SELECT *
FROM customers
WHERE customer_id IN (5, 10, 15, 20, 25, 30);

-- 7. Identify customers whose names start with the letter ‘A’
SELECT name
FROM customers
WHERE name LIKE 'A%';

-- 8. List electronics products priced under ₹3,000
SELECT *
FROM products
WHERE category = 'Electronics' 
AND price < 3000;

-- 9. Display product names and prices in descending order of price
SELECT name, price
FROM products
ORDER BY price DESC;

-- 10. Display product names and prices, sorted by price and then by name
SELECT name, price
FROM products
ORDER BY price DESC, name;