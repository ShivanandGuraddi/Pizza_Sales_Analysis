# Total Revenue
select
round(sum(total_price),2) as total_revenue
from pizza_sales.sales ;

# Average Order Value 
select
round(sum(total_price)/count(distinct(order_id))) as Average_Order
from pizza_sales.sales ;

# Total Pizza Sold
select
sum(quantity) as total_pizza_sold ;

# Total Orders
select
count(distinct(order_id)) as Total_Orders
from pizza_sales.sales ;

# Average Pizzas Per Order
select
round(sum(quantity)/count(distinct(order_id)),2) as Average_pizzas
from pizza_sales.sales ;

# Daily Trend for Total Orders
select
dayname(order_date) as order_day
,count(distinct(order_id)) as total_orders
from pizza_sales.sales
group by dayname(order_date)
order by total_orders desc ;

# Monthly Trend for Orders
select
monthname(order_date) as order_day
,count(distinct(order_id)) as total_orders
from pizza_sales.sales
group by monthname(order_date)
order by total_orders desc ;

# % of Sales by Pizza Category
select
pizza_category
,round(sum(total_price)) as total_revenue
,concat(round((sum(total_price) * 100/(select sum(total_price) from pizza_sales.sales)),2),"%") as "% of Sales"
from pizza_sales.sales
group by pizza_category ;

# % of Sales by Pizza Size
select
pizza_size
,round(sum(total_price)) as total_revenue
,concat(round((sum(total_price) * 100/(select sum(total_price) from pizza_sales.sales)),2),"%") as "% of Sales"
from pizza_sales.sales
group by pizza_size ;

# Total Pizzas Sold by Pizza Category
select
pizza_category
,sum(quantity) as Total_pizza
from pizza_sales.sales
group by pizza_category ;

# Top 5 Pizzas by Revenue
select
pizza_name
,round(sum(total_price),2) as total_revenue
from pizza_sales.sales
group by pizza_name
order by total_revenue desc
limit 5 ;

# Bottom 5 Pizzas by Revenue
select
pizza_name
,round(sum(total_price),2) as total_revenue
from pizza_sales.sales
group by pizza_name
order by total_revenue
limit 5 ;

# Top 5 Pizzas by Quantity 
select
pizza_name
,sum(quantity) as total_quantity
from pizza_sales.sales
group by pizza_name
order by total_quantity desc
limit 5 ;

# Bottom 5 Pizzas by Quantity
select
pizza_name
,sum(quantity) as total_quantity
from pizza_sales.sales
group by pizza_name
order by total_quantity
limit 5 ;

# Top 5 Pizzas by Total Orders
select
pizza_name
,count(distinct(order_id)) as total_order
from pizza_sales.sales
group by pizza_name
order by total_order desc
limit 5 ;

# Bottom 5 Pizzas by Total Orders
select
pizza_name
,count(distinct(order_id)) as total_order
from pizza_sales.sales
group by pizza_name
order by total_order
limit 5 ;

# price of each pizza
select
distinct(pizza_name)
,unit_price
from pizza_sales.sales
order by unit_price