show TABLES;

select * from netflix_customers;

select count(*) from netflix_customers where Account_Status = "Active";

select Subscription_Plan, count(*) as customer_count from netflix_customers group by Subscription_Plan order by customer_count;

select Subscription_Plan, sum(Customer_Revenue) as total from netflix_customers group by Subscription_Plan ;

select Genre, count(*) as view from netflix_customers GROUP BY Genre order by view desc;

select Country, count(*) as Customer from netflix_customers GROUP BY Country order by Customer desc;

select Device , count(*) as User from netflix_customers group by Device order by User desc;

select Subscription_Plan , round(avg(Watch_Hours),2) as Total_Hours from netflix_customers group by Subscription_Plan order by Total_Hours desc;

select Customer_ID ,Customer_Name , Customer_Revenue from netflix_customers order by Customer_Revenue desc limit 10;

select Content_Type , count(*) total from netflix_customers GROUP BY Content_Type order by total desc ;

select Genre, round(avg(Avg_Rating),2) avg_rating from netflix_customers group by Genre order by avg_rating desc;


select Account_Status , count(*) as total from netflix_customers group by Account_Status ;
