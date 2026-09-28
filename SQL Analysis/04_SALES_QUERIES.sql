use ecommerce360_db;

-- =============================================
--           SQL PRACTICE QUESTIONS 
-- =============================================

      -- 1 -- EXISTS OR NOT EXISTS TYPE

-- Find all customers who have NEVER placed any order.
-- (Use EXISTS or NOT EXISTS in your solution.)
SELECT c.customerid, c.customername
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customerid = c.customerid
);
-- Find all customers who have never returned any product.

     SELECT c.customerid, c.customername
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    JOIN returns r ON r.orderid = o.orderid
    WHERE o.customerid = c.customerid
);


--  Find all customers who have placed at least one order 
-- in the year 2025.

SELECT c.customerid, c.customername
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customerid = c.customerid
    AND YEAR(o.orderdate) = 2025
);



--  Find all products that have 
-- been ordered in a quantity of more than 10 in at least one single order.

SELECT p.productid, p.productname
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM orderdetails od
    WHERE od.productid = p.productid
    AND od.quantity > 10
);


--  Find all categories that have 
-- NO products listed under them.

SELECT c.categoryid ,c.categoryname from categories c 
WHERE NOT exists (
select 1 from products p 
where p.categoryid = c.categoryid
);

--  Find all customers who have placed an order 
-- for a product belonging to the 'Electronics' category. 
-- (Solve using EXISTS, joining orders -> orderdetails -> products -> categories)

SELECT c.customerid, c.customername
FROM customers c
WHERE c.customerid IN (SELECT o.customerid
FROM orders o 
JOIN orderdetails od ON od.orderid = o.orderid
JOIN products p ON p.productid = od.productid
JOIN categories cat ON cat.categoryid = p.categoryid
WHERE cat.categoryname = 'Electronics');

              --   2 ==== DATE QUESTIONS

-- Q1 (Basic extraction): Find the number of orders placed in each month 
-- of year 2025. Show month_name and order_count, ordered by month
    
        SELECT monthname(orderdate) as Month_name, count(orderid) as no_of_orders
         FROM orders 
		 where year(orderdate)=2025
         GROUP BY monthname(orderdate), month(orderdate)
         order by month(orderdate);


-- Find the average number of days between order date and 
-- return date, for orders that were returned. 

SELECT AVG(DATEDIFF(r.returndate, o.orderdate)) AS avg_days_to_return
FROM orders o
JOIN returns r ON o.orderid = r.orderid;

--  (DATE_ADD/DATE_SUB): Find all orders that were delivered more than 
-- 7 days after the order date (i.e., deliverydate > orderdate + 7 days).




--  (Current date functions): Find all customers whose most recent order 
-- was placed more than 90 days ago from today.

SELECT customerid
FROM (
    SELECT customerid, 
           MAX(orderdate) AS recent_order,
           DATEDIFF(CURDATE(), MAX(orderdate)) AS date_diff
    FROM orders
    GROUP BY customerid
) t
WHERE date_diff > 90;                    


-- (DATE_FORMAT / extracting weekday): Find how many orders were placed 
-- on each day of the week (Monday, Tuesday, etc.) — show day_name and 
-- order_count, ordered by order_count descending.

SELECT DAYNAME(orderdate) weeks,count(orderid) as No_of_Orders
from orders 
group by DAYNAME(orderdate)
ORDER BY count(orderid)DESC;


--  For each month (Jan-Dec), 
-- compare total sales in 2025 vs total sales in 2024. Show month_name, 
-- sales_2024, sales_2025, and growth_percentage.


SELECT 
    MONTHNAME(o.orderdate) AS month_name,
    SUM(CASE WHEN YEAR(o.orderdate) = 2024 THEN od.quantity * od.unitprice ELSE 0 END) AS sales_2024,
    SUM(CASE WHEN YEAR(o.orderdate) = 2025 THEN od.quantity * od.unitprice ELSE 0 END) AS sales_2025,
    ROUND(
        (SUM(CASE WHEN YEAR(o.orderdate) = 2025 THEN od.quantity * od.unitprice ELSE 0 END) 
         - SUM(CASE WHEN YEAR(o.orderdate) = 2024 THEN od.quantity * od.unitprice ELSE 0 END)) 
        * 100.0 
        / NULLIF(SUM(CASE WHEN YEAR(o.orderdate) = 2024 THEN od.quantity * od.unitprice ELSE 0 END), 0)
    , 2) AS growth_percentage
FROM orders o
JOIN orderdetails od ON od.orderid = o.orderid
WHERE YEAR(o.orderdate) IN (2024, 2025)
GROUP BY MONTHNAME(o.orderdate), MONTH(o.orderdate)
ORDER BY MONTH(o.orderdate);

--  ==============================
--  3  OFFSET QUESTIONS
-- ===============================

-- Q1  Find the 3rd highest total order value customer 
-- (skip top 2, show the next one) 


SELECT customerid, SUM(totalamount) AS order_value
FROM orders
GROUP BY customerid
ORDER BY SUM(totalamount) DESC
LIMIT 1 OFFSET 2;


-- Q2  Show orders 11 to 20 (page 2, assuming 10 orders 
-- per page), ordered by orderdate descending.

SELECT orderid,orderdate 
FROM orders 
ORDER BY  ORDERDATE desc
LIMIT 10 OFFSET 10;


-- Q3 Find the 5th most recent order overall, 
--  then think about how you'd solve it using ROW_NUMBER() 

SELECT orderid , orderdate 
FROM orders 
ORDER BY orderdate DESC
LIMIT 1 OFFSET 4;

SELECT orderid, orderdate
FROM (
    SELECT orderid, orderdate,
           ROW_NUMBER() OVER (ORDER BY orderdate DESC) AS rn
    FROM orders
) t
WHERE rn = 5;
               



