-- This allows us to get a view of the intial dataset 
SELECT *
FROM [AutoSales].[dbo].[ECommerceDataset]

-- We see there are several columns with NULL values, hence, we need to understand the statistic in these coulumns to know if the AVG would be ideal for imputing NULL values
SELECT 
     AVG(Tenure) AS Avg_Tenure 
   , MAX(Tenure) AS Max_Tenure 
   , MIN(Tenure) AS Min_Tenure 
   , ROUND(STDEV(Tenure),3) AS StdDev_Tenure
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
     AVG(HourSpendOnApp) AS Avg_Hour_Spend_On_App 
   , MAX(HourSpendOnApp) AS Max_Hour_Spend_On_App 
   , MIN(HourSpendOnApp) AS Min_Hour_Spend_On_App 
   , ROUND(STDEV(HourSpendOnApp),3) AS StdDev_Hour_Spend_On_App
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
     AVG(WarehouseToHome) AS Avg_Warehouse_To_Home
   , MAX(WarehouseToHome) AS Max_Warehouse_To_Home 
   , MIN(WarehouseToHome) AS Min_Warehouse_To_Home 
   , ROUND(STDEV(WarehouseToHome),3) AS StdDev_Warehouse_To_Home
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
     AVG(CouponUsed) AS Avg_Coupon_Used
   , MAX(CouponUsed) AS Max_Coupon_Used 
   , MIN(CouponUsed) AS Min_Coupon_Used 
   , ROUND(STDEV(CouponUsed),3) AS StdDev_Coupon_Used
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
     AVG(DaySinceLastOrder) AS Avg_Day_Since_Last_Order 
   , MAX(DaySinceLastOrder) AS Max_Day_Since_Last_Order
   , MIN(DaySinceLastOrder) AS Min_Day_Since_Last_Order 
   , ROUND(STDEV(DaySinceLastOrder),3) AS StdDev_Day_Since_Last_Order
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
     AVG(OrderAmountHikeFromlastYear) AS Avg_Order_Amount_Hike_From_last_Year
   , MAX(OrderAmountHikeFromlastYear) AS Max_Order_Amount_Hike_From_last_Year 
   , MIN(OrderAmountHikeFromlastYear) AS Min_Order_Amount_Hike_From_last_Year 
   , ROUND(STDEV(OrderAmountHikeFromlastYear),3) AS StdDev_Order_Amount_Hike_From_last_Year
FROM [AutoSales].[dbo].[ECommerceDataset]

SELECT 
      AVG(OrderCount) AS Avg_Order_Count
    , MAX(OrderCount) AS Max_Order_Count 
    , MIN(OrderCount) AS Min_Order_Count 
    , ROUND(STDEV(OrderCount),3) AS StdDev_Order_Count
FROM [AutoSales].[dbo].[ECommerceDataset]

-- From this, we can then impute the AVG into the NULL cells in our dataset without distorting the AVG values for each column 
UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET Hourspendonapp = (SELECT AVG(Hourspendonapp) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE Hourspendonapp IS NULL

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET tenure = (SELECT AVG(tenure) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE tenure IS NULL 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET orderamounthikefromlastyear = (SELECT AVG(orderamounthikefromlastyear) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE orderamounthikefromlastyear IS NULL 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET WarehouseToHome = (SELECT  AVG(WarehouseToHome) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE WarehouseToHome IS NULL 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET couponused = (SELECT AVG(couponused) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE couponused IS NULL 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET ordercount = (SELECT AVG(ordercount) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE ordercount IS NULL 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET daysincelastorder = (SELECT AVG(daysincelastorder) FROM [AutoSales].[dbo].[ECommerceDataset])
WHERE daysincelastorder IS NULL 

-- All NULL values have now been imputed, however, we observed some redundant data in our dataset that needs to be corrected. 

SELECT preferredlogindevice 
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferredLoginDevice

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET preferredlogindevice = 'phone'
WHERE preferredlogindevice = 'mobile phone'

SELECT PreferedOrderCat
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferedOrderCat

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET PreferedOrderCat = 'Mobile Phone'
WHERE PreferedOrderCat = 'Mobile' 
 
SELECT PreferredPaymentMode
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY PreferredPaymentMode 

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET PreferredPaymentMode = 'Cash on Delivery'
WHERE PreferredPaymentMode = 'COD'

UPDATE [AutoSales].[dbo].[ECommerceDataset]
  SET PreferredPaymentMode = 'Credit Card'
WHERE PreferredPaymentMode = 'CC'

SELECT * 
  FROM [AutoSales].[dbo].[ECommerceDataset]

-- The dataset has now been updated for our analysis and we move on to answer the questions we highlighted earlier 

-- What is the overall churn rate?
SELECT COUNT(CustomerID) AS Total_Customers
	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
	 , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
FROM [AutoSales].[dbo].[ECommerceDataset]

-- Which demographic groups exhibit the highest churn rate?
SELECT Gender
     , MaritalStatus
	 , CityTier
     , AVG(Tenure) AS Avg_Tenure
     , COUNT(CustomerID) AS Total_Customers
  	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY Gender, MaritalStatus, CityTier;

-- Do cashback incentives, paymentmode and complaints affect customer retention?
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

-- How long do churned customers spend on the app?
SELECT CASE WHEN Churn = 1 THEN 'Yes' ELSE 'No' END AS Churn_Status 
   	 , ROUND(AVG(HourSpendOnApp),2) AS Avg_HR_Spent_On_App
 FROM [AutoSales].[dbo].[ECommerceDataset]
GROUP BY Churn 
ORDER BY Avg_HR_Spent_On_App DESC

-- How do different preferred device users compare in terms of churn?
SELECT PreferredLoginDevice
     , COUNT(CustomerID) AS Total_Customers
	 , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY PreferredLoginDevice
ORDER BY Churn_Rate DESC

-- What is the relationship between Tenure and Churn Rate?
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

-- Is there a relationship between the number of devices registered and churn?
SELECT NumberofDeviceRegistered
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY NumberofDeviceRegistered
ORDER BY Churn_Rate DESC 

-- How does satisfaction score relate to churn?
SELECT satisfactionscore
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY satisfactionscore
ORDER BY Churn_Rate DESC

-- What is the impact of order frequency on churn?
SELECT OrderCount
     , COUNT(CustomerID) AS Total_Customers
     , SUM(CAST(Churn AS INT)) AS Churned_Customers 
     , ROUND((SUM(CAST(Churn AS float))*100 / COUNT(CustomerID)),2) AS Churn_Rate 
 FROM [AutoSales].[dbo].[ECommerceDataset] 
GROUP BY OrderCount, Complain
ORDER BY Churn_Rate DESC;
