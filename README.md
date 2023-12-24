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

**Before**

![Table Null Values ](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/4c7e92bc-d404-42cd-b07f-cf582912026f)

**Imputation**

![Screenshot 2023-12-17 063645](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/6bc5176b-e1c1-4fe1-8c1c-4dce87373621)

**After**

![Complete Table](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/4735ed4b-cd70-405b-8dc4-4d599b630ea6)
  
## ✨ Exploratory Analysis 
We explored the dataset to answer the following questions: 

- What is the overall churn rate?
Purpose: Understand the percentage of customers who have stopped using the service or product. This provides an initial overview of customer attrition.

	![Overall Churn Rate ](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/ceb86dfe-ee29-4102-8d2a-11d20bd6d5d1)

- Which demographic groups exhibit the highest churn rate?
Purpose: Identify specific customer segments (age, gender, city tier, marital status, etc.) more prone to churning. This helps in targeted retention strategies for vulnerable groups.

	![Demographic Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/9a9aa4e7-aee6-4305-8869-d587fcf6f058)

- Do cashback incentives, paymentmode and complaints affect customer retention?
Purpose: Evaluate if customers receiving cashback are less likely to churn. Insights can help in optimizing incentive programs for retention.


	![cashback incentive and payment mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b5f27ed6-ec30-4047-89a7-a291e407bab7)

	![Top 25 Preferred Order and Payment Mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d17434da-d099-43c6-a4ea-26fdb19a8b00)


- How long do churned customers spend on the app?

	![Time Spent on App](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/72fd363f-a33a-40dc-9538-428489c47b27)

- How do different preferred device users compare in terms of churn?
Purpose: Understand if customers using a particular login device have a higher tendency to churn. This may aid in optimizing services for specific device users.

	![Preferred Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b84c650f-5d05-4d18-a424-d3fcba260d50)

- What is the relationship between Tenure and Churn Rate?
Purpose: Explore if there is a tenure range expected for churn. This is for segmentation and to allow for proper retention strategies according to tenure.

	![Tenure Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b9d95423-8d19-4e5b-afaa-963b1eaa6d1f)


- Is there a relationship between the number of devices registered and churn?
Purpose: Investigate if customers with multiple registered devices are more or less likely to churn. This insight may influence device-specific engagement strategies.

	![Registered Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b2e9d01c-af65-48df-a86d-3d8b09d05cdf)

- How does satisfaction score relate to churn?
Purpose: Analyze whether dissatisfied customers are more prone to churn. This can inform efforts to improve satisfaction levels and retain customers.

	![Satisfaction Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/82fc3116-ba3a-4b29-9992-e7237d504921)

- What is the impact of order frequency on churn?
Purpose: Investigate if customers who make frequent orders are less likely to churn. Insights can guide efforts to increase customer engagement.

	![Order Frequency Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d46c447d-f760-4151-be40-4e0156820a84)


## ⚡ Data Analysis 

