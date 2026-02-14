--1)what is the total revenue generated male vs female
select gender,sum(purchase_amount) as revenue
from customer group by gender
--2)which customers used a discount but still spent morethan the average of purchase_amount?
select customer_id,purchase_amount from customer
where discount_applied = 'Yes' and purchase_amount >= (select Avg(purchase_amount) from customer)
--3)which are the top 5 products with highest average review ratings
select item_purchased ,ROUND(Avg(review_rating)::numeric,2) from customer
group by item_purchased
order by Avg(review_rating) desc
limit 5
--4)compare the average purchase amounts between standard and express shipping
select shipping_type, ROUND(Avg(purchase_amount),2) from customer
where shipping_type in ('Standard','Express')
group by shipping_type
--5)do subscribed customers spend more?compare average spend and total revenue blw subscribers and non sub
select subscription_status, COUNT (customer_id)as total_customers,
ROUND (Avg(purchase_amount),2) as avg_spend,
ROUND (sum(purchase_amount),2) as total_revenue from customer
group by subscription_status
order by total_revenue,avg_spend desc;
--6)which 5 products have the highest percentage of purchases with discount applied
select item_purchased,
ROUND (100 * Sum(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*),2)as discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5;
--7)Segment customers into new, returning,and lloyal based on their total number of previous purchases,and show the count of each segment.
with customer_type as(
select customer_id,previous_purchases,
CASE
WHEN previous_purchases = 1 THEN 'New'
WHEN previous_purchases BETWEEN 2 AND 10 Then 'Returning'
ELSE 'Loyal'
END AS customer_segment
from customer
)
select customer_segment, count(*) as "Number of Customers"
from customer_type
group by customer_segment
--8)what are the top 3 most purchased products within each category
with item_counts as (
select category,
item_purchased,
COUNT(customer_id) as total_orders,
ROW_NUMBER()over(partition by category order by count(customer_id) DESC) as item_rank
from customer
group by category,item_purchased
)
select item_rank,category,item_purchased,total_orders
from item_counts where item_rank <= 3;
--9)Are customers who are repeat buyers(more than 5 previous purchases)also likely to subscribe
select subscription_status,
count(customer_id)as repeat_buyers from customer where previous_purchases >5
group by subscription_status
--10)what is the revenue contribution of each age group
select age_group,sum(purchase_amount)as total_revenue from customer
group by age_group
order by total_revenue desc;


