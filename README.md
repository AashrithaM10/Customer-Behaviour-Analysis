# 🛒 Customer Shopping Behavior Analysis

## 📌 Project Overview
This project analyzes customer shopping behavior using transactional data from **3,900 purchases** across multiple product categories.

The goal is to uncover insights into:
- Spending patterns  
- Customer segmentation  
- Product preferences  
- Subscription behavior  

These insights help drive **data-driven business decisions**.

---

## 📊 Dataset Summary
**Rows:** 3,900  
**Columns:** 18  

### Key Features
- **Customer Demographics:** Age, Gender, Location, Subscription Status  
- **Purchase Details:** Item Purchased, Category, Purchase Amount, Season, Size, Color  
- **Shopping Behavior:** Discount Applied, Previous Purchases, Frequency of Purchases, Review Rating, Shipping Type  

**Missing Values**
- 37 missing values in `review_rating`

---

## 🧹 Data Processing & EDA (Python)

### ✔ Data Preparation
- Loaded dataset using pandas  
- Checked structure using `.info()` and `.describe()`  

### ✔ Missing Value Handling
- Imputed missing `review_rating` values  
- Used median rating per product category  

### ✔ Data Cleaning
- Converted column names to snake_case  
- Removed redundant column `promo_code_used`  

### ✔ Feature Engineering
- Created `age_group` column by binning ages  
- Generated `purchase_frequency_days`  

### ✔ Database Integration
- Connected Python to PostgreSQL  
- Loaded cleaned dataset into database for SQL analysis  

---

## 🗄 SQL Business Analysis (PostgreSQL)

Key business questions answered:

1. Revenue comparison by gender  
2. High-spending customers using discounts  
3. Top 5 products by rating  
4. Shipping type spending comparison  
5. Subscribers vs non-subscribers revenue  
6. Discount-dependent products  
7. Customer segmentation (New / Returning / Loyal)  
8. Top 3 products per category  
9. Repeat buyers vs subscription likelihood  
10. Revenue contribution by age group  

---

## 📈 Dashboard (Power BI)

![Power BI Dashboard](dashboard.png)

An interactive dashboard was created to visualize:

- Revenue trends  
- Customer segmentation  
- Product performance  
- Discount impact  
- Subscription insights  

---

## 💡 Business Recommendations

- Promote subscription benefits  
- Introduce customer loyalty programs  
- Review discount strategy  
- Highlight top-rated & best-selling products  
- Focus marketing on high-revenue age groups  

---

## 🛠 Tech Stack

- Python (pandas, numpy, matplotlib, seaborn)  
- PostgreSQL  
- Power BI  
- Jupyter Notebook  

---
