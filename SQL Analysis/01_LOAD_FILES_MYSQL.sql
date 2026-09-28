use ecommerce360_db;

-- ============================================================
-- DATA IMPORT (LOAD DATA)
-- ============================================================
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/categories_clean.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/customers_clean.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/products_clean.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/orders_clean.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/orderdetails_clean.csv'
INTO TABLE orderdetails
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
 
LOAD DATA LOCAL INFILE 'D:/analyst project/E-Commerce 360 Sales, Customer & Product Insights/Data/Cleaned Data/returns_clean.csv'
INTO TABLE returns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;