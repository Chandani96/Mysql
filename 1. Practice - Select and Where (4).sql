-- 1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character .
SELECT *
FROM SUPERSTORE
WHERE Customer_Name LIKE "_a_d%" ;



-- 2- write a sql to get all the orders placed in the month of dec 2020 .
SELECT * 
FROM superstore
WHERE Order_Date >= "2020-12-01" AND Order_Date <= "2020-12-31";





-- 3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 .
SELECT COUNT(*)
FROM superstore
WHERE Ship_Mode  <> "Standard Class" AND  Ship_Mode <> "First Class"
AND Ship_Date >= "2020-12-01";




-- 4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" .
SELECT COUNT(*)
FROM superstore
WHERE Customer_Name NOT LIKE "A%n";

-- 5- write a query to get all the orders where profit is negative .
SELECT COUNT(*) 
FROM superstore
WHERE Profit < 0;

-- 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 .
SELECT COUNT(*) 
FROM superstore
WHERE Quantity < 3 Or Profit = 0;


-- 7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region
-- where some discount is provided to the customers .
SELECT COUNT(*)
FROM superstore
WHERE Region= "South" AND discount > 0;


-- 8- write a query to find top 5 orders with highest sales in furniture category 
SELECT *
FROM superstore
WHERE category = "Furniture"
ORDER BY  sales DESC
LIMIT 5;


-- 9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only .
SELECT COUNT(*)
FROM superstore
WHERE category IN ("Technology","Furniture") AND Order_Date >= " 2020-01-01" AND Order_Date <="2020-12-31";

-- 10 -write a query to find all the orders where order date is in year 2020 but ship date is in 2021 .
SELECT COUNT(*)
FROM superstore
WHERE Order_date >= " 2020-01-01" AND Order_Date <="2020-12-31" AND Ship_date >= "2021-01-01" AND Ship_date <= "2021-12-31";

-- 11 Write a query to get total profit, first order
-- date and latest order date for each category
SELECT category , SUM(profit) as total_profit ,
MIN(order_date) as first_order,
MAX(order_date) as latest_order
FROM superstore
GROUP BY category;

-- 12. How many orders were placed on each day?
SELECT order_date , COUNT(DISTINCT order_id) as n_orders 
FROM superstore
GROUP BY order_date;


-- 13. How many orders were placed for each type of Ship mode? 
SELECT ship_mode , COUNT(DISTINCT order_id) as n_orders
FROM superstore
GROUP BY ship_mode;

-- 14. How many orders were placed on each day for Furniture Category?
SELECT order_date, COUNT(DISTINCT order_id) as n_orders
FROM superstore
WHERE category = "Furniture"
GROUP BY order_date;

-- 15. How many orders were placed per day 
		-- for the days when sales was greater than 1000?
 SELECT order_date, COUNT(DISTINCT order_id) as n_orders 
 FROM superstore
 GROUP BY order_date
 HAVING SUM(sales) > 1000;
 
-- 16. How many Sub categories and products are there for each categories?
SELECT category, COUNT(DISTINCT sub_category) as n_sub,
COUNT(DISTINCT product_id) as n_prod
FROM superstore
GROUP BY category;


-- 17. Find sales, profit and Quantites sold for each categories.
SELECT category, SUM(Sales) as total,sum(Profit),SUM(Quantity)
FROM superstore
GROUP BY category;

-- 18. Write a query to find top 5 sub categories in west region by total quantity sold
SELECT sub_category 
FROM superstore
WHERE region = "West"
GROUP BY sub_category
ORDER BY sum(quantity) DESC
LIMIT 5;

-- 19. Write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT region, ship_mode, SUM(sales) as total
FROM superstore
WHERE Order_date >= "2020-01-01" AND order_date <= "2020-12-31"
GROUP BY region, ship_mode;

-- 20. Find quantities sold for combination of each category and subcategory
SELECT category, sub_category, SUM(quantity) as quantity_sold
FROM superstore
GROUP BY category, sub_category;


-- 21. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold is greater than 2


 SELECT category, sub_category, SUM(quantity) as quantity_sold
FROM superstore
GROUP BY category, sub_category
HAVING sum(quantity) > 2 ; 

-- 22. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold in the combination is greater than 100
 SELECT category, sub_category, SUM(quantity) as quantity_sold
FROM superstore
GROUP BY category, sub_category
HAVING sum(quantity) > 100 ;

-- 23. Get the records which have smallest Product Name.

select min(length(product_name))as minLength
from superstores;

select *
from superstore
where length(product_name) = (select min(length(product_name))as minLength
                               from superstores); 