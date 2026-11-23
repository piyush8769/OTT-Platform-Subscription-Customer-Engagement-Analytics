-- ==============================================================
-- OTT Platform Subscription & Customer Engagement Analysis
-- Database: netflix_db
-- Author: Piyush Kumar Singh
-- ==============================================================

USE netflix_db;

-- 1. Inspect table structure and sample records
SHOW TABLES;
SELECT * FROM netflix_customers LIMIT 10;

-- 2. Overall subscriber status breakdown (Active, Cancelled, Paused)
SELECT 
    Account_Status, 
    COUNT(*) AS total_subscribers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_customers), 2) AS percentage
FROM netflix_customers 
GROUP BY Account_Status;

-- 3. Total active subscribers count
SELECT COUNT(*) AS active_subscribers 
FROM netflix_customers 
WHERE Account_Status = 'Active';

-- 4. Customer distribution by subscription plan (Basic, Standard, Premium)
SELECT 
    Subscription_Plan, 
    COUNT(*) AS customer_count 
FROM netflix_customers 
GROUP BY Subscription_Plan 
ORDER BY customer_count DESC;

-- 5. Revenue generated per subscription plan
SELECT 
    Subscription_Plan, 
    ROUND(SUM(Customer_Revenue), 2) AS total_revenue 
FROM netflix_customers 
GROUP BY Subscription_Plan 
ORDER BY total_revenue DESC;

-- 6. Average watch hours by subscription tier
SELECT 
    Subscription_Plan, 
    ROUND(AVG(Watch_Hours), 2) AS avg_watch_hours 
FROM netflix_customers 
GROUP BY Subscription_Plan 
ORDER BY avg_watch_hours DESC;

-- 7. Viewership popularity by content genre
SELECT 
    Genre, 
    COUNT(*) AS view_count 
FROM netflix_customers 
GROUP BY Genre 
ORDER BY view_count DESC;

-- 8. Average user ratings per genre
SELECT 
    Genre, 
    ROUND(AVG(Avg_Rating), 2) AS avg_rating 
FROM netflix_customers 
GROUP BY Genre 
ORDER BY avg_rating DESC;

-- 9. Content type distribution (Movies vs TV Shows)
SELECT 
    Content_Type, 
    COUNT(*) AS total_content 
FROM netflix_customers 
GROUP BY Content_Type 
ORDER BY total_content DESC;

-- 10. Country-wise subscriber adoption
SELECT 
    Country, 
    COUNT(*) AS customer_count 
FROM netflix_customers 
GROUP BY Country 
ORDER BY customer_count DESC;

-- 11. Streaming device usage preferences
SELECT 
    Device, 
    COUNT(*) AS user_count 
FROM netflix_customers 
GROUP BY Device 
ORDER BY user_count DESC;

-- 12. Top 10 high-value customers by total revenue
SELECT 
    Customer_ID, 
    Customer_Name, 
    ROUND(Customer_Revenue, 2) AS total_revenue 
FROM netflix_customers 
ORDER BY total_revenue DESC 
LIMIT 10;
