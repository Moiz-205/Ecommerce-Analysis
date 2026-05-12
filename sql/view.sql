CREATE VIEW Revenue_Trend_View AS
SELECT
    order_year AS Order_Year,
    order_month AS Order_Month,
    ROUND(SUM(price), 2) AS Total_Revenue
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

CREATE VIEW Top_Product_Categories_View AS
SELECT
    product_category AS Product_Category,
    ROUND(SUM(total_item_value), 2) AS Total_Revenue
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY product_category
ORDER BY Total_Revenue DESC
LIMIT 15;

CREATE VIEW Payment_Type_Breakdown_View AS
SELECT
    payment_type AS Payment_Type,
    COUNT(payment_type) AS Total_Payments_Types,
    SUM(payment_value) AS Total_Payment_Value
FROM order_payments
GROUP BY Payment_Type
ORDER BY Total_Payment_Value DESC;

CREATE VIEW Average_Payment_Installment_View AS
SELECT
    payment_type AS Payment_Type,
    AVG(payment_installments) AS Average_Installments
FROM order_payments
GROUP BY Payment_Type
ORDER BY Average_Installments DESC;

CREATE VIEW Top_Seller_States_View AS
SELECT
    seller_state AS Seller_State,
    ROUND(SUM(total_item_value), 2) AS Total_Revenue
FROM sellers
JOIN order_items ON sellers.seller_id = order_items.seller_id
GROUP BY Seller_State
ORDER BY Total_Revenue DESC
LIMIT 10;

CREATE VIEW Customer_State_Distribution_View AS
SELECT
    customer_state AS Customer_States,
    COUNT(customer_id) AS Total_Customers
FROM customers
GROUP BY Customer_States
ORDER BY Total_Customers DESC;

CREATE VIEW Order_Status_Breakdown_View AS
SELECT
    order_status AS Order_Status,
    COUNT(order_id) AS Number_of_Orders
FROM orders
GROUP BY order_status;

CREATE VIEW Delivery_Performance_View AS
SELECT
    order_year AS Order_Year,
    order_month AS Order_Month,
    ROUND(AVG(delivery_days), 2) AS Avg_Delivery_Days,
    ROUND(AVG(delivery_delay_days), 2) AS Avg_Delay_Days
FROM orders
WHERE delivery_days IS NOT NULL
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
