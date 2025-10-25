-- TOTAL REVENUE-- 
SELECT SUM(QUANTITY * UNIT_PRICE) AS TOTAL_REVENUE
FROM pizza_sales;
-- OR
SELECT SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM pizza_sales;


-- AVERAGE ORDER VALUE --
Select SUM(Total_price)/COUNT(DISTINCT(Order_id)) AS Avg_order_value
FROM pizza_sales;
 
 
-- TOTAL PIZZA SOLD --
Select SUM(quantity) AS Total_quantity FROM pizza_sales;


-- TOTAL NOS OF ORDERS --
Select COUNT(DISTINCT(Order_id))AS Total_orders FROM pizza_sales;


-- AVERAGE PIZZAS PER ORDER -- 
-- calculated by dividing the total numbers of pizzas sold by the total number of order --
Select SUM(quantity)/COUNT(DISTINCT(Order_id)) AS Avg_pizzas_per_order FROM pizza_sales;


-- DAILY TRENDS FOR TOTAL ORDERS --
SELECT 
    DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);


-- PERCENTAGE OF SALES BY PIZZA CATEGORY --
Select 
	pizza_category, SUM(total_price) AS total_sales,
    Round(SUM(total_price) * 100 /(SELECT sum(total_price) 
    FROM pizza_sales),2) as total_rev_in_percentage
from pizza_sales
-- WHERE MONTH(ORDER_DATE) = 2   IF WE WANT TO RETRIVE THE TOTAL SALE PERCENTAGE IN FEBRUARY MONTH --
group by pizza_category;


-- PERCENTAGE OF SALES BY PIZZA SIZE --
SELECT pizza_size, SUM(total_price) AS total_sales, 
	SUM(total_price) * 100 / (SELECT sum(total_price) 
    FROM pizza_sales) as total_rev_in_percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_rev_in_percentage DESC;


-- TOTAL PIZZA SOLD BY PIZZA CATEGORY --
Select pizza_category, Sum(quantity) AS total_quantity 
From pizza_sales 
group by pizza_category 
order by total_quantity desc;


-- TOP 5 BEST SELLERS BY TOTAL PIZZA SOLD --
SELECT pizza_name, SUM(quantity) AS total_pizza_sold 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_pizza_sold DESC
LIMIT 5 ;    


-- TOP 5 WORST SELLERS BY TOTAL PIZZA SOLD --
SELECT pizza_name, SUM(quantity) AS total_pizza_sold 
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_pizza_sold ASC
LIMIT 6 ;
