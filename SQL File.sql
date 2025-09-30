Create database task 
use task
# a. Extract Month & Year from Order Date

  SELECT distinct
    EXTRACT(YEAR FROM STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_year,
   EXTRACT(MONTH FROM STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_month 
FROM Orders;

# b. Total Revenue (SUM of Amount)

SELECT 
    SUM(Amount) AS total_revenue
FROM Details;
 
 # c. Order Volume (COUNT DISTINCT Order ID)
 
 SELECT 
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM Orders;

# d. Monthly Revenue
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_month,
    SUM(d.Amount) AS total_revenue
FROM Orders o JOIN Details d 
    ON o.`Order ID` = d.`Order ID` 
    GROUP BY order_year, order_month;
    
# e. Monthly Order Volume
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT o.`Order ID`) AS total_orders FROM Orders o
GROUP BY order_year, order_month;

# f. Limit Results to a Specific Time Period (2018 example)
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS order_month,
    SUM(d.Amount) AS total_revenue,
    COUNT(DISTINCT o.`Order ID`) AS total_orders FROM Orders o JOIN Details d ON o.`Order ID` = d.`Order ID`
WHERE STR_TO_DATE(o.`Order Date`, '%d-%m-%Y') BETWEEN '2018-01-01' AND '2018-12-31'
GROUP BY order_year, order_month ORDER BY order_year, order_month;


