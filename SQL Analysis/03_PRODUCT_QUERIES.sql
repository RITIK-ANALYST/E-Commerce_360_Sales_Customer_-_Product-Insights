use ecommerce360_db;

-- 1 Find products that have never been ordered.
-- Show product name and category name.

SELECT p.productname, c.categoryname
FROM products p
JOIN categories c ON p.categoryid = c.categoryid
WHERE NOT EXISTS (
    SELECT 1
    FROM orderdetails od
    WHERE od.productid = p.productid
);


-- 2  Find all orders placed on weekends (Saturday/Sunday) in the year 2024.
-- Show orderid, customername, orderdate, and the day name (e.g., 'Saturday').

SELECT  o.orderid,c.customername,o.orderdate,
    DAYNAME(o.orderdate) AS day_name
FROM orders o
JOIN customers c ON o.customerid = c.customerid
WHERE YEAR(o.orderdate) = 2024
  AND DAYOFWEEK(o.orderdate) IN (1, 7);   -- 1 = Sunday, 7 = Saturday

-- 3 Find duplicate customer records — customers with the same customername and city
-- Show customername, city, and how many times they are duplicated.

SELECT c.customername, c.city, COUNT(*) AS Duplicated 
FROM customers c
GROUP BY c.customername, c.city
HAVING COUNT(*) > 1;

-- 4 Delete duplicate customer records, keeping only one copy per customername + city.

DELETE c1 FROM customers c1
JOIN customers c2 
  ON c1.customername = c2.customername 
  AND c1.city = c2.city
  AND c1.customerid > c2.customerid;

-- 5  Find the second highest order amount for each customer.
-- Show customer name and the second highest order amount.

SELECT customername,
       MAX(CASE WHEN rnk = 2 THEN Total_amount END) AS second_highest_amount
FROM (
    SELECT c.customername, 
           o.totalamount AS Total_amount,
           DENSE_RANK() OVER(PARTITION BY c.customername ORDER BY o.totalamount DESC) AS rnk
    FROM customers c 
    JOIN orders o ON o.customerid = c.customerid
) t
GROUP BY customername;

-- 6 Find the running total (cumulative sum) of order amounts for each customer,
-- ordered by orderdate.
-- Show customer name, orderdate, order amount, and running total.

SELECT  c.customername ,o.orderdate  , o.totalamount as Total_amount,
                     sum(o.totalamount) over(partition by c.customername order by o.orderdate) as Rinning_total
                     From customers c JOIn orders o 
                     on c.customerid = o.customerid;

-- 7 Find the top 5 best-selling products in each category (by total quantity sold).
-- Show category name, product name, total quantity sold, and rank within category.
SELECT * FROM (
    SELECT c.categoryname, p.productname, 
           SUM(od.quantity) AS total_quantity,
           RANK() OVER(PARTITION BY c.categoryname ORDER BY SUM(od.quantity) DESC) AS rnk
    FROM categories c 
    JOIN products p ON c.categoryid = p.categoryid
    JOIN orderdetails od ON p.productid = od.productid
    GROUP BY c.categoryname, p.productname
) t
WHERE rnk <= 5;              

-- 8 For each category, find the product with the lowest total revenue
-- Show category name, product name, and total revenue.

SELECT  categoryname , productname , Total_revenue from(
SELECT c.categoryname , p.productname ,
             sum(od.quantity * od.unitprice) as Total_revenue ,
             rank() over(partition by c.categoryname order by sum(od.quantity * od.unitprice)) as rnk
FROM categories c join products p 
             on c.categoryid = p.categoryid
             JOIN orderdetails od on 
             p.productid = od.productid 
group by c.categoryname , p.productname
)t
where rnk =1 ; 

-- 9 Find products where the total quantity ordered is above the average 
-- quantity ordered across all products.
-- Show product name, total quantity ordered.

SELECT p.productname, SUM(od.quantity) AS Total_quantity
FROM products p 
JOIN orderdetails od ON p.productid = od.productid
GROUP BY p.productname
HAVING SUM(od.quantity) > (
    SELECT AVG(total_qty) FROM (
        SELECT SUM(od2.quantity) AS total_qty
        FROM orderdetails od2
        GROUP BY od2.productid
    ) t
);

-- For each customer, find their first order date and their most recent order date.
-- Show customer name, first order date, most recent order date, and the number 
-- of days between them.
-- (If a customer has only 1 order, days between should be 0)

SELECT customername, First_order, Recent_order,
       DATEDIFF(Recent_order, First_order) AS Days_btw_orders
FROM (
    SELECT c.customername, 
           MIN(o.orderdate) AS First_order, 
           MAX(o.orderdate) AS Recent_order
    FROM customers c 
    LEFT JOIN orders o ON c.customerid = o.customerid 
    GROUP BY c.customername
) t;

















