E-COMMERCE 360: SALES, CUSTOMER & PRODUCT INSIGHTS  

An end-to-end data analytics project that takes a raw, messy e-commerce dataset through Python cleaning, MySQL analysis and a Power BI dashboard, and turns it into business insights on sales, customers, products and returns.  


////////////////////////////////////////////////////////////  

PROJECT OVERVIEW  

• Goal: Understand what drives revenue, who the customers are, and why orders get returned  
• Data: Synthetic e-commerce dataset with 6 related tables, Jan 2019 to Dec 2025  
• Scale: 5,000 customers, 20,000 orders, about 50,000 order lines, 525 products, 15 categories, 2,200 returns  
• Tools: Python (Pandas, Matplotlib, Seaborn), MySQL, Power BI (DAX)  
• Note: The dataset is synthetic and was generated for practice. It is not scraped from any real e-commerce platform.  

////////////////////////////////////////////////////////////  

BUSINESS QUESTIONS  

• How is revenue growing, and is the growth healthy?  
• Which categories, brands and cities drive sales?  
• Who are the customers (age, gender, spending behaviour)?  
• How often are orders returned, and why?  

////////////////////////////////////////////////////////////  

HEADLINE KPIs  

• Total Revenue: 3.57 bn  
• Total Orders: 20,000  
• Total Customers: 5,000  
• Average Order Value: about 178K  
• Return Rate: 11%  

////////////////////////////////////////////////////////////  

KEY FINDINGS  

1. Growth is strong but slowing  

• Revenue grew from about 47M in 2019 to about 1.04 bn in 2025, and yearly orders rose from 267 to 5,868.  
• Year-on-year growth cooled sharply: +44% in 2024 and only about +9% in 2025.  
• Insight: The business has moved from a rapid-growth phase to a maturing one. Future growth must come from retention, higher basket value and lower return losses, not only from new customers.  

2. Returns are the biggest operational problem  

• 11% of all orders are returned (2,200 of 20,000).  
• Damaged product (21%), late delivery (17%) and defective product (16%) make up about 55% of all returns. All three can be fixed with better packaging, logistics and quality checks.  
• Insight: Fixing these three reasons alone can reduce the return rate meaningfully without changing customer behaviour.  

3. Revenue is well diversified across categories  

• No single category dominates. All 15 categories contribute between about 5.9% and 8.2% of revenue.  
• Top categories: Stationery & Office Supplies (8.2%), Home & Kitchen (7.3%) and Furniture (7.1%). The top 5 together make up only about 36%.  
• Insight: Low category dependency means lower risk. Growth levers should be chosen at product and brand level.  

4. A few brands lead the revenue chart  

• Novatek, Kravon and Vantra are the top three brands by revenue (about 0.45 bn, 0.41 bn and 0.40 bn).  
• Insight: These brands are natural candidates for promotions, bundles and inventory priority.  

5. Customer behaviour is very uniform  

• The customer base is nearly balanced: about 52% male and 48% female.  
• Average order value is almost the same: about 177.8K (female) vs 178.9K (male), a gap of under 1%.  
• AOV stays flat across age groups (about 177K to 181K).  
• Insight: There is no case for gender-specific or age-specific pricing. Segmentation should be based on behaviour (frequency, recency, category preference).  

6. Spending is spread across many customers  

• The top 20% of customers generate about 38% of revenue, far below the classic 80/20 pattern.  
• Insight: Revenue does not depend on a few big spenders, so loyalty programs should target the broad repeat-buyer base.  

7. Cash on Delivery is the most popular payment mode  

• COD is used for about 24% of orders. UPI, Net Banking, Credit Card and Debit Card each hold about 19%.  
• Insight: COD often carries higher return and failed-delivery risk, so return rate by payment mode is worth tracking as a follow-up.  

////////////////////////////////////////////////////////////  

PROJECT WORKFLOW  

1. Raw CSVs with duplicates and missing values  
2. Python: data cleaning with Pandas, saved as cleaned CSVs  
3. MySQL: load cleaned tables into ecommerce360_db and run business queries  
4. Python: exploratory data analysis with Seaborn and Matplotlib  
5. Power BI: data model, DAX measures and interactive dashboard  

////////////////////////////////////////////////////////////  

REPOSITORY STRUCTURE  

ecommerce-360-sales-insights/
├── data/
│   ├── raw/
│   └── cleaned/
├── python-analysis/
│   └── 02_Exploratory_Data_Analysis.py
├── sql/
│   ├── 01_LOAD_FILES_MYSQL.sql
│   ├── 02_CUSTOMER_QUERIES.sql
│   ├── 03_PRODUCT_QUERIES.sql
│   └── 04_SALES_QUERIES.sql
├── powerbi/
│   └── Executive_summary_dashboard.pbix
├── images/
│   └── Power_BI_dashboard.png
└── README.md
////////////////////////////////////////////////////////////  

DATA MODEL (database: ecommerce360_db)  

• categories: categoryid, categoryname  
• customers: customerid, customername, gender, age, city, joindate  
• products: productid, productname, categoryid, brand, price  
• orders: orderid, customerid, orderdate, paymentmode, totalamount  
• orderdetails: orderdetailid, orderid, productid, quantity, unitprice  
• returns: returnid, orderid, returndate, reason  

////////////////////////////////////////////////////////////  

SKILLS DEMONSTRATED  

• Python: data cleaning (duplicates, missing values), EDA with Pandas, Matplotlib and Seaborn  
• SQL (MySQL): joins, aggregations, subqueries, EXISTS / NOT EXISTS, window functions (RANK, DENSE_RANK, ROW_NUMBER, running totals), date functions, LIMIT / OFFSET, duplicate removal  
• Power BI: data modelling, DAX measures, KPI cards, multi-visual dashboard design  
• Business analysis: turning data into clear recommendations  

////////////////////////////////////////////////////////////  

HOW TO RUN  

1. Clone the repository.  
2. Create the database and tables in MySQL. Update the file paths in sql/01_LOAD_FILES_MYSQL.sql to your local data/cleaned folder and run it.  
3. Run the query files in the sql folder on ecommerce360_db.  
4. For EDA, install the libraries: pip install pandas matplotlib seaborn. Then update the CSV paths at the top of the Python file and run it.  
5. Open powerbi/Executive_summary_dashboard.pbix in Power BI Desktop.  

////////////////////////////////////////////////////////////  

ROADMAP  

• Dashboard pages: Sales & Revenue, Customer Analytics, Product & Returns, Key Insights, with page navigation  
• Hypothesis testing (male vs female order value) and regression analysis in Python  
• Star-schema data model and SQL views  
• Return rate by payment mode and by category  

////////////////////////////////////////////////////////////  

AUTHOR  

Ritik Tiwari  
MBA (Finance & Marketing) | Aspiring Data Analyst  
Madhya Pradesh, India  
LinkedIn: https://www.linkedin.com/in/your-profile  
GitHub: https://github.com/your-username
