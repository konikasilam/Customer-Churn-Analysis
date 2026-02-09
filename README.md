# Customer Churn Analysis (End-to-End Data Analytics Project)
This project focuses on analyzing customer churn behavior using a real-world telecom-style dataset. The objective is to identify churn patterns, high-risk customer segments, and support data-driven decision-making for business stakeholders. The project follows a structured data analytics lifecycle including data cleaning, SQL-based analysis, and business intelligence reporting.

# Business Problem

Customer churn directly impacts revenue and long-term growth. The business aims to:

  * Identify customer segments with high churn
  
  * Analyze churn patterns based on age, tenure, revenue, contract, and services
  
  * Use insights to design effective retention strategies

# Dataset Description

The dataset contains customer demographic details, service usage information, billing data, and churn indicators.

Key Columns Include:

Customer_ID

Gender, Age, Married, State

Tenure_in_Months

Service attributes (Internet_Type, Streaming services, Support plans, etc.)

Monthly_Charge, Total_Revenue

Customer_Status (Stayed / Churned / Joined)

Churn_Category, Churn_Reason

# Step 1: Data Cleaning (Python OR Excel Power Query)
Tools Used

* Python (Pandas, NumPy)
* Excel Power Query

  * Cleaning Steps Performed
  
  * Removed duplicate records
  
  * Handled null values in categorical columns
  
  * Standardized Yes/No categorical values
  
  * Validated numerical columns (Monthly Charges, Revenue)
  
  * Checked and logically handled negative values
  
  * Verified and corrected data types

Output File: ```cleaned_customer_data.csv```

# Step 2: SQL Analysis – Business Questions & Insights

All analysis was performed using SQL on the cleaned dataset loaded into MySQL. The following business questions were answered using SQL queries:

1️⃣ Total Customers
```
SELECT COUNT(*) AS Total_Customer
FROM Cleaned_Customer_Data;
```

2️⃣ Overall Churn Rate
```
SELECT 
    ROUND(
        COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM Cleaned_Customer_Data;
```

3️⃣ Churn by Contract Type
```
SELECT Contract,
       COUNT(*) AS Churned_Customer
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned'
GROUP BY Contract
ORDER BY Churned_Customer DESC;
```
4️⃣ Revenue Lost Due to Churn
```
SELECT ROUND(SUM(Total_Revenue), 2) AS Revenue_Lost
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned';
```

5️⃣ Early Churn Analysis (Tenure < 6 Months)
```
SELECT COUNT(*) AS Early_Churn_Customer
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned'
  AND Tenure_in_Months < 6;
```

6️⃣ Churn by Internet Type
```
SELECT Internet_Type,
       COUNT(*) AS Churn_Count
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned'
GROUP BY Internet_Type
ORDER BY Churn_Count DESC;
```

7️⃣ Top Churn Reasons
```
SELECT Churn_Reason,
       COUNT(*) AS Occurrences
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Reason
ORDER BY Occurrences DESC;
```

8️⃣ Churn by Churn Category
```
SELECT Churn_Category,
       COUNT(*) AS Occurrences
FROM Cleaned_Customer_Data
WHERE Customer_Status = 'Churned'
GROUP BY Churn_Category
ORDER BY Occurrences DESC;
```

9️⃣ Age-Based Churn Analysis
```
SELECT 
    CASE 
        WHEN Age < 25 THEN '18–25'
        WHEN Age BETWEEN 25 AND 34 THEN '25–34'
        WHEN Age BETWEEN 35 AND 44 THEN '35–44'
        WHEN Age BETWEEN 45 AND 54 THEN '45–54'
        WHEN Age BETWEEN 55 AND 64 THEN '55–64'
        ELSE '65+'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Pct
FROM Cleaned_Customer_Data
GROUP BY Age_Group
ORDER BY Churn_Rate_Pct DESC;
```

# Step 3: Business Intelligence Reporting

The analyzed SQL data was integrated with Power BI to enable interactive dashboards and stakeholder-level reporting.

<img width="1301" height="730" alt="Screenshot 2026-02-09 200547" src="https://github.com/user-attachments/assets/021de7bb-3721-420c-b4f0-85c752a40054" />


# Tools & Technologies Used

Python (Pandas, NumPy)

Excel Power Query

MySQL

SQL (CASE statements, aggregations)

Power BI

# Conclusion

This project demonstrates practical, real-world data analytics skills including data cleaning, SQL-driven business analysis, and business intelligence reporting, making it well-suited for Data Analyst and Data Scientist fresher roles.

