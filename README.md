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

	Our sales store had 5630 customers, 948 churned and thus with a 16.84% churn rate. 

- Which demographic groups exhibit the highest churn rate?
Purpose: Identify specific customer segments (age, gender, city tier, marital status, etc.) more prone to churning. This helps in targeted retention strategies for vulnerable groups.

	![Demographic Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/9a9aa4e7-aee6-4305-8869-d587fcf6f058)

	We analyze demographic data to recognize the distinct personas among our customers who churn. This analysis reveals that the majority consisted of married females from City 2, single females from City 3, and single males from City 3.
	Understanding these patterns can help tailor strategies or interventions targeted towards these groups to potentially reduce churn rates. Further analysis and exploration into the behaviour, preferences, and experiences of these groups may uncover underlying reasons for their higher churn rates, allowing for more targeted retention efforts or improvements in service provision tailored to their needs.

- Do cashback incentives, paymentmode and complaints affect customer retention?
Purpose: Evaluate if customers receiving cashback are less likely to churn. Insights can help in optimizing incentive programs for retention.

	![cashback incentive and payment mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b5f27ed6-ec30-4047-89a7-a291e407bab7)

	![Top 25 Preferred Order and Payment Mode](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d17434da-d099-43c6-a4ea-26fdb19a8b00)

 	Examining the favoured payment methods, we notice that customers opting for cash on delivery experienced the highest churn rate, trailed closely by those utilizing e-wallets, and then by those using UPI. Upon further investigation, it became evident that many of these customers lodged complaints about the products received from the store. Notably, the frequently churning customers often purchased fashion items, mobile phones, groceries, and various other products.

- How long do churned customers spend on the app?

	![Time Spent on App](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/72fd363f-a33a-40dc-9538-428489c47b27)

	Interestingly, both customers who churned and stayed had similar average hours spent on the app at 2 hours. Thus indicating that the average time spent on the app may not necessarily be a segregating  factor for churn

- How do different preferred device users compare in terms of churn?
Purpose: Understand if customers using a particular login device have a higher tendency to churn. This may aid in optimizing services for specific device users.

	![Preferred Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b84c650f-5d05-4d18-a424-d3fcba260d50)

 	To comprehend the impact of various devices on churn, it's essential to establish a benchmark for what constitutes high or low churn rates in our ECommerce store. Customers logging in via computers exhibit a 19.83% churn rate, whereas those using mobile devices show a 15.62% churn rate, resulting in a difference of 4.21% or approximately 23.75% in percentage terms. Further exploration into device preferences among customers is crucial. Understanding these patterns would yield valuable insights into the correlation between preferred devices and churn rates.

- What is the relationship between Tenure and Churn Rate?
Purpose: Explore if there is a tenure range expected for churn. This is for segmentation and to allow for proper retention strategies according to tenure.

	![Tenure Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b9d95423-8d19-4e5b-afaa-963b1eaa6d1f)

 	Customer loyalty appears to be the foundation of our ECommerce store. Customers with over 2 years of tenure exhibit notably low churn rates, while those between 6 months and 2 years experience single-digit churn rates. However, customers with less than 6 months of tenure demonstrate a higher churn rate, with 32 out of every 100 customers eventually churning. Tracking the seasonality across various segments would aid in understanding potential seasonal trends and their influence on our churn rates and thus coming up with better retention strategies. 

- Is there a relationship between the number of devices registered and churn?
Purpose: Investigate if customers with multiple registered devices are more or less likely to churn. This insight may influence device-specific engagement strategies.

	![Registered Device Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/b2e9d01c-af65-48df-a86d-3d8b09d05cdf)

	The number of devices owned by customers significantly influences their likelihood of churn within our customer base. Surprisingly, this analysis reveals distinct patterns: customers owning more than 2 devices demonstrate a clear propensity to churn. Specifically, while customers with 3 and 4 devices exhibit relatively lower churn rates of 14.94% and 16.49% respectively, the churn rate for those with 5 devices stands at 22.47%. Moreover, customers possessing 6 devices exhibit the highest likelihood of churning, currently at a substantial rate of 34.57%. These findings underscore the importance of delving deeper into the underlying reasons driving higher churn rates among customers with multiple devices. Understanding these dynamics is crucial in devising targeted strategies to retain and engage this customer segment effectively.

- How does satisfaction score relate to churn?
Purpose: Analyze whether dissatisfied customers are more prone to churn. This can inform efforts to improve satisfaction levels and retain customers.

	![Satisfaction Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/82fc3116-ba3a-4b29-9992-e7237d504921)

	Unexpectedly, our analysis reveals a positive correlation between satisfaction scores and churn. This suggests that customers who churn often show higher levels of satisfaction with the services provided by our ECommerce store. This unexpected relationship prompts further investigation into the underlying factors contributing to customer churn despite apparent satisfaction levels with the services rendered.

- What is the impact of order frequency on churn?
Purpose: Investigate if customers who make frequent orders are less likely to churn. Insights can guide efforts to increase customer engagement.

	![Order Frequency Churn](https://github.com/TegaOghoghoX/ECommerce_Churn/assets/154087927/d46c447d-f760-4151-be40-4e0156820a84)

 	Customers with higher order frequencies tend to exhibit higher churn rates, contradicting the assumption that more frequent orders equate to higher loyalty or retention. Also, customers placing 8 orders show the highest churn rate at 44.9%, closely followed by those with 7 orders at 44.07%. These are the two highest churn rates among the observed order frequencies. Contrary to the anticipated trend, customers placing only a single order show a relatively lower churn rate of 31.92%, which is lower than several other order frequencies. Interestingly, there seems to be a slight decrease in churn rates for customers with order counts between 13 and 16, where the churn rates range between 28.57% and 35.29%.
In summary, while there appears to be a general trend of higher order frequencies correlating with higher churn rates, there are exceptions. For instance, customers with a single order surprisingly show a lower churn rate compared to certain other order frequencies.

## ⚡ Insights and Recommendations 
- Overall Churn Rate:
  The overall churn rate for our sales store stands at 16.84%, indicating customer attrition. This provides an initial overview of attrition, allowing us to assess and address the scope of customer loss.
  
- Demographic Groups:
  Analysis reveals specific demographic segments with higher churn rates: married females in City 2, single females in City 3, and single males in City 3. Tailoring retention strategies for these segments might mitigate higher churn rates.
  
- Payment Modes and Complaints:
  Surprisingly, customers using cash on delivery and e-wallets experience high churn rates, with many complaints about product quality. Understanding purchase behaviour and improving service provision might help retain these customers.
  
- App Usage and Churn:
  The average time spent on the app is similar for churned and retained customers (2 hours), indicating app usage may not be a decisive factor for churn.
  
- Preferred Devices and Churn:
  Customers logging in via computers exhibit a higher churn rate (19.83%) compared to mobile device users (15.62%). Further exploration into device preferences can yield insights for optimizing services.
  
- Tenure and Churn:
  Customer loyalty plays a pivotal role. Over 2 years of tenure exhibits lower churn rates, while <6 months tenure indicates a higher churn rate (32%). Tracking seasonality trends could enhance retention strategies.
  
- Devices Registered and Churn: Customers owning more devices (>2) are more likely to churn, with a clear trend of increasing churn rates with a higher number of devices. Tailored strategies for engaging customers with multiple devices might aid in retention efforts.
  
- Satisfaction Score and Churn: Unexpectedly, higher satisfaction scores correlate with higher churn rates, suggesting dissatisfaction might not be the main driver for churn.
  
- Order Frequency and Churn: Higher order frequencies do not consistently equate to lower churn. Some unexpected patterns reveal lower churn rates for single-order customers compared to certain other frequencies.
  
## Recommendations:
- Implement targeted retention strategies for vulnerable demographic groups.
- Improve service quality for cash on delivery and e-wallet users, addressing customer complaints.
- Tailor engagement strategies for customers with multiple devices to reduce churn.
- Investigate the apparent contradiction between satisfaction scores and churn for deeper insights.
- Develop tailored engagement programs for different order frequency segments to mitigate churn rates.

