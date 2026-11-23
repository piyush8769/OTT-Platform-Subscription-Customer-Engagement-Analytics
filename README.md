# OTT Platform Subscription & Customer Engagement Analytics

An end-to-end data analytics project analyzing subscriber behavior, plan performance, and churn patterns across 958 customers using Python (Pandas), MySQL, and Power BI.

---

## Project Overview

In subscription streaming platforms, customer retention and viewing engagement directly drive profitability. When users stop watching, churn follows shortly after.

The goal of this project was to analyze raw viewing and subscription records to answer four core questions:
1. **Who is churning?** How do active, cancelled, and paused accounts differ in their viewing habits?
2. **Which plans drive revenue?** What is the subscriber count and revenue contribution across Basic, Standard, and Premium tiers?
3. **What keeps users engaged?** Which genres and content types (Movies vs. TV Shows) hold the highest watch time and ratings?
4. **Where are users watching?** Which devices (Mobile, Smart TV, Laptop, Tablet, Gaming Console) dominate streaming hours?

---

## Power BI Executive Dashboard

An interactive dashboard built to give stakeholders a clear view of platform revenue, active subscribers, and engagement patterns across devices and regions.

![Netflix Data Analytics Dashboard](images/dashboard_overview.jpg)

### Key Metrics Summary

| Total Revenue | Total Subscribers | Active Customers |
| :---: | :---: | :---: |
| ![Total Revenue](images/total_revenue.png) | ![Total Customers](images/total_customers.png) | ![Active Customers](images/active_customers.png) |

| Average Watch Hours | Average Content Rating |
| :---: | :---: |
| ![Average Watch Hours](images/average_watch_hours.png) | ![Average Rating](images/average_rating.png) |

---

## Key Insights & Takeaways

- **Early Churn Warning:** Customers who ended up cancelling watched roughly 40% less content in their first month compared to active users. Accounts logging under 15 hours a month are at immediate risk of churn.
- **Plan Performance:** The **Premium Plan** brought in the highest overall revenue and volume (over 340 subscribers), while having churn rates on par with the lower-cost Basic tier.
- **Where Users Stream:** Mobile and Smart TVs together drove over 65% of total watch hours. Optimizing mobile playback and TV app interfaces has the biggest direct impact on user experience.
- **Paused Subscribers as an Opportunity:** Paused accounts make up 9.57% of total revenue (~₹672K). Targeting them with re-engagement emails before they convert to full cancellations is a low-cost retention win.

---

## Analytical Steps

1. **Python & Pandas:**
   - Handled duplicate customer records and converted placeholder text (`N/A`, `NULL`, blanks) to null values.
   - Used median imputation for missing watch hours and monthly fees to prevent outlier distortion.
   - Filtered out bad inputs (such as ages outside 18–100 and negative values).
   - Created derived metrics: Customer Revenue, Engagement Scores, and demographic/watch-time brackets using `pd.cut`.

2. **MySQL Database Storage:**
   - Loaded the sanitized dataset into MySQL as `netflix_customers`.
   - Wrote 12 targeted business queries (`ott_subscription_queries.sql`) to summarize plan revenues, average watch time, device usage, and genre rankings.

3. **Power BI Dashboard:**
   - Built KPI scorecards, status breakdown donut charts, subscription plan bar charts, and a geographic country map.
   - Added interactive slicers for device types (Mobile, Smart TV, Laptop, Tablet, Gaming Console).

---

## Sample SQL Analysis

The `ott_subscription_queries.sql` file contains 12 queries. Here is an example calculating volume and revenue across subscription tiers:

```sql
SELECT 
    Subscription_Plan, 
    COUNT(*) AS customer_count,
    ROUND(SUM(Customer_Revenue), 2) AS total_revenue,
    ROUND(AVG(Watch_Hours), 2) AS avg_watch_hours
FROM netflix_customers 
GROUP BY Subscription_Plan 
ORDER BY total_revenue DESC;
```

---

## Repository Structure

```
├── images/
│   ├── dashboard_overview.jpg            # Full Power BI executive dashboard view
│   ├── total_revenue.png                 # KPI: Total Revenue
│   ├── total_customers.png               # KPI: Total Customers
│   ├── active_customers.png              # KPI: Active Customers
│   ├── average_watch_hours.png           # KPI: Average Watch Hours
│   └── average_rating.png                # KPI: Average Rating
├── OTT_Unclean_Project.xlsx              # Raw dataset
├── OTT_Clean_Data.csv                    # Cleaned dataset (995 rows, 25 columns)
├── OTT_Platform.ipynb                    # Data cleaning & feature engineering notebook
├── ott_subscription_queries.sql          # 12 analytical SQL queries
├── OTT_Platform_PowerBI.pbix             # Power BI dashboard file
├── .gitignore
└── README.md
```
