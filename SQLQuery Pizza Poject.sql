SELECT *
FROM [Project Pizza]

--finding the total revenue

SELECT SUM(total_price) AS total_revenue
FROM [Project Pizza]

--finding the avaerage order value

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS avg_order_value FROM [Project Pizza]

--Total pizza sold

SELECT SUM(quantity) AS total_pizza_sold FROM [Project Pizza]

--Total orders placed

SELECT COUNT(DISTINCT order_id) AS total_orders FROM [Project Pizza]

--Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS avg_pizza_per_order FROM [Project Pizza]

--daily trend for the orders

SELECT DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT order_id) AS total_orders
FROM
	[Project Pizza]
GROUP BY
	DATENAME(DW, order_date)

--monthly trend of orders

SELECT DATENAME(MONTH, order_date) AS order_month,
	COUNT(DISTINCT order_id) AS total_orders
FROM
	[Project Pizza]
GROUP BY
	DATENAME(MONTH, order_date)
ORDER BY total_orders DESC;

--percentage of sales by Pizza Category

SELECT pizza_category,
	SUM(total_price) AS total_sales,
	SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [Project Pizza]) AS pct_sales_by_pizza_category
FROM [Project Pizza]
GROUP BY pizza_category

--percentage of sales by pizza size

SELECT pizza_size,
	CAST(SUM(total_price) AS DECIMAL (10,2)) AS total_sales,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [Project Pizza]) AS DECIMAL (10, 2)) AS pct_sales_by_pizza_size
FROM [Project Pizza]
GROUP BY pizza_size
ORDER BY pct_sales_by_pizza_size DESC

-- top 5 best sellers by revenue, total quantity and total orders

-- Top 5 by revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM [Project Pizza]
GROUP BY pizza_name
ORDER BY total_revenue DESC

--Bottom 5 by revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM [Project Pizza]
GROUP BY pizza_name
ORDER BY total_revenue ASC


--TOP 5 by total quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM [Project Pizza]
GROUP BY pizza_name
order by total_quantity DESC

--bottom 5 by total quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM [Project Pizza]
GROUP BY pizza_name
order by total_quantity ASC

-- Top 5 by total orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM [Project Pizza]
GROUP BY pizza_name
ORDER BY total_orders DESC

--bottom 5 by total orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM [Project Pizza]
GROUP BY pizza_name
ORDER BY total_orders ASC