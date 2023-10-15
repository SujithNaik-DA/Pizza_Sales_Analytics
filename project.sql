use project;
-- 1. Total Revenue: The sum of the total price of all pizza orders.
select sum(total_price) from pizza_sales;

-- 2. Average Order Value: The average amount spent per order, calculated by dividing the
-- total revenue by the total number of orders.
select sum(total_price)/count(distinct order_id) from pizza_sales;

-- 3. Total Pizzas Sold: The sum of the quantities of all pizzas sold.
select sum(quantity) from pizza_sales;

-- 4. Total Orders: The total number of orders placed.
select count(distinct order_id) from pizza_sales;

-- 5. Average Pizzas Per Order: The average number of pizzas sold per order, calculated by
-- dividing the total number of pizzas sold by the total number of orders
select round(sum(quantity)/count(distinct order_id),2) from pizza_sales;

-- Daily Trend for Total Orders
-- convert format of date to yyyy-mm-dd
-- UPDATE pizza_sales
-- SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

SELECT dayname(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY dayname(order_date);

-- 2.Monthly Trend for Total Orders:
SELECT monthname(order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY monthname(order_date)
order by total_orders desc ;

-- D. % of Sales by Pizza Category

select pizza_category, sum(total_price) as total_revenue ,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2)
from pizza_sales
group by pizza_category;


-- 4.Percentage of Sales by Pizza Size:
select pizza_size,cast(sum(total_price)as decimal(10,2))as total_revenue,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) as pct
from pizza_sales
group by pizza_size
order by pct desc ;

  
-- 5.Total Pizzas Sold by Pizza Category:
select pizza_category, sum(quantity) as total_quantity_sold
from pizza_sales
group by pizza_category;





-- 6.Top 5 Best Sellers by Revenue, Total Quantity and Total Orders e
select pizza_name,sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;



-- 7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders
select pizza_name ,sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue
limit 5;

-- . Top 5 Pizzas by Quantity
select pizza_name,sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by quantity desc
limit 5;

-- bottom 5 Pizzas by Quantity
select pizza_name,sum(quantity) as quantity
from pizza_sales
group by pizza_name
order by quantity
limit 5;

-- Top 5 Pizzas by Total Orders
select pizza_name, count( distinct order_id) as total_order 
from pizza_sales
group by pizza_name
order by total_order desc
limit 5;

-- bottom 5 Pizzas by Total Orders
select pizza_name , count(distinct order_id) as total_order
from pizza_sales
group by pizza_name
order by total_order 
limit 5;
select * from pizza_sales;
