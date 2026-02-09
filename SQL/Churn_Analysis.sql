CREATE DATABASE churn_customer;

USE churn_customer;

SELECT * 
FROM cleaned_customer_data;

-- Total customer

SELECT COUNT(*) AS Total_Customer
FROM Cleaned_Customer_Data;

SELECT COUNT(*) AS Total_Churn_Customer
FROM Cleaned_Customer_Data
WHERE Customer_Status="Churned";

-- overall churn rate
SELECT 
	ROUND( 
		COUNT(CASE WHEN Customer_Status='Churned' THEN 1 END) *100.0 /
        COUNT(*),
        2
        ) AS churn_rate_percentage
FROM cleaned_customer_data;


-- churn by contract type
SELECT Contract,
COUNT(*) AS Churned_Customer
FROM Cleaned_Customer_Data
WHERE Customer_Status='Churned'
GROUP BY Contract
ORDER BY Churned_Customer DESC;


-- revenue lost due to churn
SELECT ROUND(SUM(Total_Revenue),2) AS Revenue_Lost
FROM Cleaned_Customer_Data
WHERE Customer_Status='Churned';

-- customer churn early
SELECT COUNT(*) AS Early_Churn_Customer
FROM Cleaned_Customer_Data
WHERE Customer_Status='Churned'
and Tenure_in_Months <6;

-- churn based on internet type
SELECT Internet_Type,COUNT(*) AS Churn_Count
FROM Cleaned_Customer_Data
where Customer_Status='Churned'
GROUP BY Internet_Type
ORDER BY Churn_Count DESC;

-- top churn resaon
SELECT Churn_Reason, COUNT(*) AS Occurences
FROM Cleaned_Customer_Data
WHERE Customer_Status='Churned'
GROUP BY Churn_Reason
ORDER BY Occurences DESC;

-- churn based on churn_category
SELECT Churn_Category, COUNT(*) AS Occurences
FROM Cleaned_Customer_Data
WHERE Customer_Status='Churned'
GROUP BY Churn_Category
ORDER BY Occurences DESC;


-- churn based on age_category

SELECT 
	CASE 
		WHEN Age <25 THEN '18-25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35–44'
        WHEN Age BETWEEN 45 AND 54 THEN '45–54'
        WHEN Age BETWEEN 55 AND 64 THEN '55–64'
        ELSE '65+'
        END AS Age_Group,
        COUNT(*) AS Total_Customers,
        SUM( CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
        ROUND(
			SUM( CASE WHEN Customer_Status='Churned' THEN 1 ELSE 0 END)*100.0/ COUNT(*),2
            ) AS Churn_Rate_Pct
FROM Cleaned_Customer_Data
GROUP BY Age_Group
ORDER BY Churn_Rate_Pct DESC;


        
        
				