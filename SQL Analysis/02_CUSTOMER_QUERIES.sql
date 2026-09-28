use ecommerce360_db;

-- Q1: Find the total number of customers in each city
SELECT city, COUNT(customerid) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Q2: List all customers who have never placed an order
SELECT c.customerid, c.customername
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
WHERE o.orderid IS NULL;

-- Q3: Find the top 5 customers by total amount spent
SELECT c.customerid, c.customername, SUM(o.totalamount) AS total_spent
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
ORDER BY total_spent DESC
LIMIT 5;

-- Q4: Find the customer who placed the maximum number of orders
SELECT c.customerid, c.customername, COUNT(o.orderid) AS order_count
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
ORDER BY order_count DESC
LIMIT 1;

-- Q5: Find the average order value grouped by gender
SELECT c.gender, ROUND(AVG(o.totalamount), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.gender;

-- Q6: Find the percentage share of male vs female customers
SELECT gender,
       COUNT(*) AS total,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY gender;

-- Q7: Rank customers by total spending within each city
SELECT c.customerid, c.customername, c.city,
       SUM(o.totalamount) AS total_spent,
       RANK() OVER (PARTITION BY c.city ORDER BY SUM(o.totalamount) DESC) AS city_rank
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername, c.city;

-- Q8: Find customers whose average order value is above the overall average order value
SELECT c.customerid, c.customername, AVG(o.totalamount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING AVG(o.totalamount) > (SELECT AVG(totalamount) FROM orders);

-- Q9: Find customers who joined more than 2 years ago (based on latest join date in the data)
SELECT customerid, customername, joindate
FROM customers
WHERE joindate < (SELECT DATE_SUB(MAX(joindate), INTERVAL 2 YEAR) FROM customers);

-- Q10: Find customers who placed orders in more than one distinct year (repeat customers across years)
SELECT c.customerid, c.customername, COUNT(DISTINCT YEAR(o.orderdate)) AS active_years
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT YEAR(o.orderdate)) > 1;






