# ECommerce_Churn Analysis

## 🎯Project Overview 

This project aims to comprehensively explore an e-commerce churn dataset, examining numerical summaries, categorical distributions, correlations, customer segmentation, missing value identification, and a detailed churn rate analysis across tenure ranges to glean insights into customer behaviour and churn patterns.

## ✨ Data Sources 
The E-Commerce Churn dataset has been obtained from [Kaggle](https://www.kaggle.com/datasets/ankitverma2010/ecommerce-customer-churn-analysis-and-prediction/data)

## ⚡ Tools 
- MS SQL Server
- Excel
- Tableau

## 🎯Data Cleaning and Preparation 
To begin the analysis, we had to better understand the data and correct for errors within our dataset. To accomplish this, we performed the following tasks: 
- Data loading and review
- Error handling
- Cleaning and formatting 
  
## ✨ Exploratory Analysis 
We explored the dataset to answer the following questions: 

- What is the overall churn rate?
Purpose: Understand the percentage of customers who have stopped using the service or product. This provides an initial overview of customer attrition.

- Which demographic groups exhibit the highest churn rate?
Purpose: Identify specific customer segments (age, gender, city tier, marital status, etc.) more prone to churning. This helps in targeted retention strategies for vulnerable groups.

- Do cashback incentives, paymentmode and complaints affect customer retention?
Purpose: Evaluate if customers receiving cashback are less likely to churn. Insights can help in optimizing incentive programs for retention.

- How long do churned customers spend on the app?

- How do different preferred device users compare in terms of churn?
Purpose: Understand if customers using a particular login device have a higher tendency to churn. This may aid in optimizing services for specific device users.

- What is the relationship between Tenure and Churn Rate?
Purpose: Explore if there is a tenure range expected for churn. This is for segmentation and to allow for proper retention strategies according to tenure. 

- Is there a relationship between the number of devices registered and churn?
Purpose: Investigate if customers with multiple registered devices are more or less likely to churn. This insight may influence device-specific engagement strategies.

- How does satisfaction score relate to churn?
Purpose: Analyze whether dissatisfied customers are more prone to churn. This can inform efforts to improve satisfaction levels and retain customers.

- What is the impact of order frequency on churn?
Purpose: Investigate if customers who make frequent orders are less likely to churn. Insights can guide efforts to increase customer engagement.

## ⚡ Data Analysis 

This allows us to get a view of the intial dataset 

```sql 
SELECT *
FROM [AutoSales].[dbo].[ECommerceDataset]
```
![Table Null Values ](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/4c7e92bc-d404-42cd-b07f-cf582912026f)


We see there are several columns with NULL values, hence, we need to understand the statistic in these coulumns to know if the AVG would be ideal for imputing NULL values

```sql 
SELECT 
    AVG(Tenure) AS Avg_Tenure, 
    MAX(Tenure) AS Max_Tenure, 
    MIN(Tenure) AS Min_Tenure, 
    ROUND(STDEV(Tenure),3) AS StdDev_Tenure
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(HourSpendOnApp) AS Avg_Hour_Spend_On_App, 
    MAX(HourSpendOnApp) AS Max_Hour_Spend_On_App, 
    MIN(HourSpendOnApp) AS Min_Hour_Spend_On_App, 
    ROUND(STDEV(HourSpendOnApp),3) AS StdDev_Hour_Spend_On_App
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(WarehouseToHome) AS Avg_Warehouse_To_Home, 
    MAX(WarehouseToHome) AS Max_Warehouse_To_Home, 
    MIN(WarehouseToHome) AS Min_Warehouse_To_Home, 
    ROUND(STDEV(WarehouseToHome),3) AS StdDev_Warehouse_To_Home
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(CouponUsed) AS Avg_Coupon_Used, 
    MAX(CouponUsed) AS Max_Coupon_Used, 
    MIN(CouponUsed) AS Min_Coupon_Used, 
    ROUND(STDEV(CouponUsed),3) AS StdDev_Coupon_Used
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(DaySinceLastOrder) AS Avg_Day_Since_Last_Order, 
    MAX(DaySinceLastOrder) AS Max_Day_Since_Last_Order, 
    MIN(DaySinceLastOrder) AS Min_Day_Since_Last_Order, 
    ROUND(STDEV(DaySinceLastOrder),3) AS StdDev_Day_Since_Last_Order
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(OrderAmountHikeFromlastYear) AS Avg_Order_Amount_Hike_From_last_Year, 
    MAX(OrderAmountHikeFromlastYear) AS Max_Order_Amount_Hike_From_last_Year, 
    MIN(OrderAmountHikeFromlastYear) AS Min_Order_Amount_Hike_From_last_Year, 
    ROUND(STDEV(OrderAmountHikeFromlastYear),3) AS StdDev_Order_Amount_Hike_From_last_Year
FROM [AutoSales].[dbo].[ECommerceDataset]
```
```sql 
SELECT 
    AVG(OrderCount) AS Avg_Order_Count, 
    MAX(OrderCount) AS Max_Order_Count, 
    MIN(OrderCount) AS Min_Order_Count, 
    ROUND(STDEV(OrderCount),3) AS StdDev_Order_Count
FROM [AutoSales].[dbo].[ECommerceDataset]
```
![Screenshot 2023-12-17 063645](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/6bc5176b-e1c1-4fe1-8c1c-4dce87373621)


From this, we can then impute the AVG into the NULL cells in our dataset without distorting the AVG values for each column 

```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET Hourspendonapp = (SELECT AVG(Hourspendonapp) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE Hourspendonapp IS NULL
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET tenure = (SELECT AVG(tenure) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE tenure IS NULL 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET orderamounthikefromlastyear = (SELECT AVG(orderamounthikefromlastyear) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE orderamounthikefromlastyear IS NULL 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET WarehouseToHome = (SELECT  AVG(WarehouseToHome) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE WarehouseToHome IS NULL 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET couponused = (SELECT AVG(couponused) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE couponused IS NULL 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET ordercount = (SELECT AVG(ordercount) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE ordercount IS NULL 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET daysincelastorder = (SELECT AVG(daysincelastorder) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE daysincelastorder IS NULL 
```
All NULL values have now been imputed, however, we observed some redundant data in our dataset that needs to be corrected. 
```sql 
SELECT preferredlogindevice 
FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferredLoginDevice
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET preferredlogindevice = 'phone'
WHERE preferredlogindevice = 'mobile phone'
```
```sql 
SELECT PreferedOrderCat
FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferedOrderCat
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET PreferedOrderCat = 'Mobile Phone'
WHERE PreferedOrderCat = 'Mobile' 
```
```sql 
SELECT PreferredPaymentMode
FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferredPaymentMode 
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET PreferredPaymentMode = 'Cash on Delivery'
WHERE PreferredPaymentMode = 'COD'
```
```sql 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
SET PreferredPaymentMode = 'Credit Card'
WHERE PreferredPaymentMode = 'CC'
```
```sql 
SELECT * 
FROM [AutoSales].[dbo].[ECommerceDataset]
```
![Complete Table](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/4735ed4b-cd70-405b-8dc4-4d599b630ea6)

Now to answer the questions we highlighted earlier 
- What is the overall churn rate?
```sql 
SELECT COUNT(CustomerID) AS Total_Customers
	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	 , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset]
```
![Overall Churn Rate ](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/ceb86dfe-ee29-4102-8d2a-11d20bd6d5d1)

- Which demographic groups exhibit the highest churn rate?
```sql
SELECT Gender
     , MaritalStatus
	   , CityTier
     , AVG(Tenure) AS Avg_Tenure
     , COUNT(CustomerID) AS Total_Customers
  	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY Gender, MaritalStatus, CityTier;
```
![Demographic Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/9a9aa4e7-aee6-4305-8869-d587fcf6f058)

- Do cashback incentives, paymentmode and complaints affect customer retention?
```sql 
SELECT PreferredPaymentMode
     , COUNT(CustomerID) AS Total_Customers
	   , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	   , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY PreferredPaymentMode
ORDER BY Churn_Rate DESC;

SELECT TOP 20 CASE WHEN Complain = 1 THEN 'Yes' ELSE 'No' END AS Complain_Made  
	 , PreferredPaymentMode
	 , SUM(CashbackAmount)
   , COUNT(CustomerID) AS Total_Customers
	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	 , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY Complain, PreferredPaymentMode
ORDER BY Churn_Rate DESC;

SELECT TOP 25 CASE WHEN Complain = 1 THEN 'Yes' ELSE 'No' END AS Complain_Made  
	 , PreferedOrderCat
	 , PreferredPaymentMode
	 , COUNT(CustomerID) AS Total_Customers
	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	 , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY Complain, PreferedOrderCat, PreferredPaymentMode
ORDER BY Churn_Rate DESC;
```
![cashback incentive and payment mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b5f27ed6-ec30-4047-89a7-a291e407bab7)

![Top 25 Preferred Order and Payment Mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d17434da-d099-43c6-a4ea-26fdb19a8b00)

-- How long do churned customers spend on the app?
```sql 
SELECT CASE WHEN Churn = 1 THEN 'Yes' ELSE 'No' END AS Churn_Status 
   	 , ROUND(AVG(HourSpendOnApp),2) AS Avg_HR_Spent_On_App
FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY Churn 
ORDER BY Avg_HR_Spent_On_App DESC
```
![Time Spent on App](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/72fd363f-a33a-40dc-9538-428489c47b27)

- How do different preferred device users compare in terms of churn?
```sql 
SELECT PreferredLoginDevice
     , COUNT(CustomerID) AS Total_Customers
	   , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY PreferredLoginDevice
ORDER BY Churn_Rate DESC
```
![Preferred Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b84c650f-5d05-4d18-a424-d3fcba260d50)

- What is the relationship between Tenure and Churn Rate?
```sql 
SELECT Tenure_Range 
	, SUM(Total_Customers) AS Customer_Total
	, SUM(Churned_Customers) AS Customer_Churned 
	, ROUND((SUM(CAST(Churned_Customers AS float))*100 / SUM(Total_Customers)),2) AS Churned_Rate 
 FROM(
	SELECT CASE WHEN CAST(tenure AS INT) <= 6 THEN 'Less than 6 Months'
	            WHEN (CAST(tenure AS INT) BETWEEN 7 AND 12) THEN 'Greater than 6 months, less than 1 Year'
	           	WHEN (CAST(tenure AS INT) BETWEEN 13 AND 24) THEN 'Greater than 1 year, less than 2 Years'
		   ELSE 'More Than 2 years' END AS Tenure_Range 
		 , COUNT(DISTINCT CustomerID) AS Total_Customers
		 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	FROM [AutoSales].[dbo].[ECommerceDataset] 
	GROUP BY Tenure 
 ) AS subquery 
GROUP BY Tenure_Range
ORDER BY Churned_Rate DESC
```
![Tenure Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b9d95423-8d19-4e5b-afaa-963b1eaa6d1f)

- Is there a relationship between the number of devices registered and churn?
```sql
SELECT NumberofDeviceRegistered
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY NumberofDeviceRegistered
ORDER BY Churn_Rate DESC 
```
![Registered Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b2e9d01c-af65-48df-a86d-3d8b09d05cdf)

- How does satisfaction score relate to churn?
```sql
SELECT satisfactionscore
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY satisfactionscore
ORDER BY Churn_Rate DESC
```
![Satisfaction Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/82fc3116-ba3a-4b29-9992-e7237d504921)

- What is the impact of order frequency on churn?
```sql
SELECT OrderCount
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY OrderCount, Complain
ORDER BY Churn_Rate DESC;
```
![Order Frequency Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d46c447d-f760-4151-be40-4e0156820a84)


