# ============================
# 1. IMPORT  LIBRARIES
# ============================

import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns



# ============================
# 2. IMPORT  DATA
# ============================

customers = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\customers_clean.csv")
orders = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\orders_clean.csv")
orderdetails = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\orderdetails_clean.csv")
products = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\products_clean.csv")
categories = pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\categories_clean.csv")
returns =pd.read_csv(r"D:\analyst project\E-Commerce 360 Sales, Customer & Product Insights\Data\Cleaned Data\returns_clean.csv")


# ============================
# 1. AGE DISTRIBUTION (CUSTOMER)
# ============================

# plt.figure(figsize=(8,5))
# sns.histplot(customers['age'], bins=15, kde=True, color='red')
# plt.title('Customer Age Distribution')
# plt.xlabel('Age')
# plt.ylabel('Number of Customers')
# plt.show()

# ============================
# 2.Customer's City Distribution
# ============================

# top_cities = customers['city'].value_counts().head(10)

# plt.figure(figsize=(10,5))
# sns.barplot(x=top_cities.index, y=top_cities.values, color='skyblue')
# plt.title('Top 10 Cities by Number of Customers')
# plt.xlabel('City')
# plt.ylabel('Number of Customers')
# plt.xticks(rotation=90)
# plt.show()


# ============================
# 3.Monthly order trend (line chart)
# ============================

# orders['orderdate'] = pd.to_datetime(orders['orderdate'])
# orders['order_month'] = orders['orderdate'].dt.to_period('M')

# monthly_orders = orders.groupby('order_month').size()

# plt.figure(figsize=(12,5))
# monthly_orders.plot(kind='line', marker='o', color='green')
# plt.title('Monthly Order Trend')
# plt.xlabel('Month')
# plt.ylabel('Number of Orders')
# plt.xticks(rotation=45)
# plt.tight_layout()
# plt.show()


# ============================
# 4.Category-wise Sales/Product Count
# ============================


# products_with_category = products.merge(categories, on='categoryid')

# category_counts = products_with_category['categoryname'].value_counts()

# plt.figure(figsize=(10,5))
# sns.barplot(x=category_counts.index, y=category_counts.values, color='orange')
# plt.title('Number of Products by Category')
# plt.xlabel('Category')
# plt.ylabel('Number of Products')
# plt.xticks(rotation=90)
# plt.tight_layout()
# plt.show()

# ============================
# 5.Category-wise Sales/Product Count
# ============================

# payment_counts = orders['paymentmode'].value_counts()

# plt.figure(figsize=(8,5))
# sns.barplot(x=payment_counts.index, y=payment_counts.values, color='teal')
# plt.title('Orders by Payment Mode')
# plt.xlabel('Payment Mode')
# plt.ylabel('Number of Orders')
# plt.xticks(rotation=(90))
# plt.tight_layout()
# plt.show()


# ============================
# 6. Payment Mode Distribution
# ============================

# orders.dropna(inplace = True)
# plt.figure(figsize=(8,5))
# sns.countplot(data=orders, x='paymentmode', order=orders['paymentmode'].value_counts().index)
# plt.title('Payment Mode Distribution')
# plt.xlabel('Payment Mode')
# plt.ylabel('Number of Orders')
# plt.xticks(rotation=90)
# plt.show()


# ============================
# 7. Customer-wise Total Sales (top spenders)
# ============================

# customer_sales = orders.groupby('customerid')['totalamount'].sum().sort_values(ascending=False).head(10)

# plt.figure(figsize=(10,5))
# sns.barplot(x=customer_sales.index, y=customer_sales.values, color='green')
# plt.title('Top 10 Customers by Total Sales')
# plt.xlabel('Customer ID')
# plt.ylabel('Total Sales Amount')
# plt.xticks(rotation=90)

# plt.show()

# ============================
# 8. Customer-wise Order counts
# ============================

customer_orders = orders['customerid'].value_counts().head(10)

plt.figure(figsize=(10,5))
sns.barplot(x=customer_orders.index, y=customer_orders.values, color='purple')
plt.title('Top 10 Customers by Number of Orders')
plt.xlabel('Customer ID')
plt.ylabel('Number of Orders')
plt.xticks(rotation=90)
plt.tight_layout()
plt.show()