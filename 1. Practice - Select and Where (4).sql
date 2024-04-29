-- Note: please do not use any functions which are not taught in the class. you need to solve the questions only with the concepts that have been discussed so far.

-- 1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
SELECT *
FROM SUPERSTORES
WHERE Customer_Name LIKE "_a_d%" ;



-- 2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
SELECT * 
FROM superstores
WHERE Order_Date >= "2020-12-01" AND Order_Date <= "2020-12-31";





-- 3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
SELECT COUNT(*)
FROM superstores
WHERE Ship_Mode  <> "Standard Class" AND  Ship_Mode <> "First Class"
AND Ship_Date >= "2020-12-01";




-- 4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
SELECT COUNT(*)
FROM superstores
WHERE Customer_Name NOT LIKE "A%n";

-- 5- write a query to get all the orders where profit is negative (1871 rows)
SELECT COUNT(*) 
FROM superstores
WHERE Profit < 0;

-- 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
SELECT COUNT(*) 
FROM superstores
WHERE Quantity < 3 Or Profit = 0;


-- 7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region
-- where some discount is provided to the customers (815 rows)
SELECT COUNT(*)
FROM superstores
WHERE Region= "South" AND discount > 0;


-- 8- write a query to find top 5 orders with highest sales in furniture category 
SELECT *
FROM superstores
WHERE category = "Furniture"
ORDER BY  sales DESC
LIMIT 5;


-- 9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
SELECT COUNT(*)
FROM superstores
WHERE category IN ("Technology","Furniture") AND Order_Date >= " 2020-01-01" AND Order_Date <="2020-12-31";

-- 10 -write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
SELECT COUNT(*)
FROM superstores
WHERE Order_date >= " 2020-01-01" AND Order_Date <="2020-12-31" AND Ship_date >= "2021-01-01" AND Ship_date <= "2021-12-31";

