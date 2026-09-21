USE ecommerce_sales_analysis;

-- 1. Overall Business KPIs
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT Customer_ID) AS total_customers,
    ROUND(SUM(Total_Amount), 2) AS total_revenue,
    ROUND(AVG(Total_Amount), 2) AS average_order_value,
    SUM(Quantity) AS total_units_sold
FROM Ecommerce_sales_cleaned;


-- 2. Monthly Revenue
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS month,
    ROUND(SUM(Total_Amount), 2) AS revenue
FROM Ecommerce_sales_cleaned
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY month;


-- 3. Returning Customer Analysis
SELECT
    Is_Returning_Customer,
    COUNT(DISTINCT Customer_ID) AS customers,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue
FROM Ecommerce_sales_cleaned
GROUP BY Is_Returning_Customer;


-- 4. Revenue by Product Category
SELECT
    Product_Category,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue,
    SUM(Quantity) AS units_sold
FROM Ecommerce_sales_cleaned
GROUP BY Product_Category
ORDER BY revenue DESC;


-- 5. Revenue by Device Type
SELECT
    Device_Type,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue
FROM Ecommerce_sales_cleaned
GROUP BY Device_Type
ORDER BY revenue DESC;


-- 6. Revenue by Payment Method
SELECT
    Payment_Method,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue
FROM Ecommerce_sales_cleaned
GROUP BY Payment_Method
ORDER BY revenue DESC;


-- 7. Top 10 Cities by Revenue
SELECT
    City,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue
FROM Ecommerce_sales_cleaned
GROUP BY City
ORDER BY revenue DESC
LIMIT 10;


-- 8. Customer Experience
SELECT
    ROUND(AVG(Customer_Rating), 2) AS average_customer_rating,
    ROUND(AVG(Delivery_Time_Days), 2) AS average_delivery_days,
    ROUND(AVG(Session_Duration_Minutes), 2) AS average_session_duration,
    ROUND(AVG(Pages_Viewed), 2) AS average_pages_viewed
FROM Ecommerce_sales_cleaned;


-- 9. Revenue by Age Group
SELECT
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        WHEN Age < 65 THEN '55-64'
        ELSE '65+'
    END AS age_group,
    COUNT(*) AS orders,
    ROUND(SUM(Total_Amount), 2) AS revenue,
    ROUND(AVG(Total_Amount), 2) AS average_order_value
FROM Ecommerce_sales_cleaned
GROUP BY age_group
ORDER BY revenue DESC;