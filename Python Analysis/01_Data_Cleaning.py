# ============================
# 1. IMPORT LIBRARIES
# ============================


import pandas as pd
import numpy as np

# ============================
# 1. IMPORT  DATA
# ============================

categories = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\categories.csv")
customers = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\customers.csv")
orders= pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\orders.csv")
orderdetails = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\orderdetails.csv")
products = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\products.csv")
returns = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Raw Data\returns.csv")


# ============================
# 2. CHECK DUPLICATES
# ============================

print("Duplicate rows in categories:", categories.duplicated().sum())
print("Duplicate rows in customers:", customers.duplicated().sum())
print("Duplicate rows in orders:", orders.duplicated().sum())
print("Duplicate rows in orderdetails:", orderdetails.duplicated().sum())
print("Duplicate rows in products:", products.duplicated().sum())
print("Duplicate rows in returns:", returns.duplicated().sum())


# ============================
# 3. CHECK MISSING VALUES
# ============================

print("\nMissing values incategories:\n",categories.isnull().sum())
print("\nMissing values in customers:\n", customers.isnull().sum())
print("\nMissing values in orders:\n", orders.isnull().sum())
print("\nMissing values in orderdetails:\n", orderdetails.isnull().sum())
print("\nMissing values in products:\n", products.isnull().sum())
print("\nMissing values in returns:\n", returns.isnull().sum())

# ============================
# 4. DROP DUPLICATES
# ============================

customers = customers.drop_duplicates()
orders = orders.drop_duplicates()
orderdetails = orderdetails.drop_duplicates()
products = products.drop_duplicates()
categories = categories.drop_duplicates()
returns = returns.drop_duplicates()

# verify 
print("Duplicates after removal:", categories.duplicated().sum())
print("Duplicates after removal:", customers.duplicated().sum())
print("Duplicates after removal:", orderdetails.duplicated().sum())
print("Duplicates after removal:", orders.duplicated().sum())
print("Duplicates after removal:", products.duplicated().sum())
print("Duplicates after removal:", returns.duplicated().sum())


# ============================
# 5. DEALING WITH MISSING VALUES
# ============================


# Dealing Misssing Values Of Customers Table

customers["age"] = customers["age"].fillna(customers["age"].mean())
customers["gender"] = customers["gender"].fillna(customers["gender"].value_counts().idxmax())
customers["city"] = customers["city"].fillna(customers["city"].mode()[0])

# verify----

print("\nMissing values(after filling missing values) in customers:\n", customers.isnull().sum())


# Dealing Misssing Values Of Orders Table

orders["paymentmode"] = orders["paymentmode"].fillna(orders["paymentmode"].mode()[0])
orders["totalamount"] =  orders["totalamount"].fillna(orders["totalamount"].mean())

# Verify ----

print("\nMissing values(after filling missing values) in orders:\n", orders.isnull().sum())

# Dealing Misssing Values Of Orderdetails Table

orderdetails["quantity"] = orderdetails["quantity"].fillna(orderdetails["quantity"].mean())
orderdetails["unitprice"] = orderdetails["unitprice"].fillna(orderdetails["unitprice"].mean())

# Verify-----

print("\nMissing values (after filling missing values) in orderdetails:\n", orderdetails.isnull().sum())

# Dealing Misssing Values Of Products Table

products["price"] = products["price"].fillna(products["price"].mean())


# Verify-----

print("\nMissing values (after filling missing values) in products:\n", products.isnull().sum())



# Dealing Misssing Values Of Returns Table

returns["reason"] = returns["reason"].fillna(returns["reason"].mode()[0])

# Verify-----

print("\nMissing values (after filling missing values) in products:\n", returns.isnull().sum())


# ============================
# 6. SAVE CLEANED DATA
# ============================

customers.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\customers_clean.csv", index=False)
orders.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\orders_clean.csv", index=False)
orderdetails.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\orderdetails_clean.csv", index=False)
products.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\products_clean.csv", index=False)
categories.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\categories_clean.csv", index=False)
returns.to_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\returns_clean.csv", index=False)

print("All cleaned files saved successfully!")