select * from pizza_sales
-------------------------------------------
select sum(total_price) from pizza_sales
--------------------------------------------
select (sum(total_price) / COUNT(distinct order_id)) as avg_order_value from pizza_sales
-----------------------------------------------
select sum(quantity) from pizza_sales
------------------------------------------------
select pizza_category, cast(sum(total_price) * 100 / (select sum(total_price)  from pizza_sales)as decimal(8,2)) as Average_value
from pizza_sales
group by pizza_category

---------------------------------------------------------------
select pizza_category, cast(sum(total_price) as decimal(8,2)) as Total_price ,cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(8,2)) as PCT
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category
-----------------------------------------------
select top(5) pizza_name, cast(sum(total_price)as decimal(8,2)) as total_revenue 
from pizza_sales
group by pizza_name
order by sum(total_price) desc
---------------------------------------------------

select top(5) pizza_name, cast(sum(total_price)as decimal(8,2)) as total_revenue 
from pizza_sales
group by pizza_name
order by sum(total_price) asc
--------------------------------------------------------

select top(5) pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by sum(quantity) desc
------------------------------------------------------------
select top(5) pizza_name, count(distinct order_id) as total_pizza_ordered
from pizza_sales
WHERE pizza_category = 'Classic'
group by pizza_name
order by total_pizza_ordered desc
-----------------------------------------------------------
select top(5) pizza_name, count(distinct order_id) as total_pizza_ordered
from pizza_sales
group by pizza_name
order by total_pizza_ordered desc
--------------------------------------------------------------
select distinct pizza_category, pizza_name
from pizza_sales
where pizza_category = 'classic'