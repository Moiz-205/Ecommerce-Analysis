ALTER TABLE orders
ADD COLUMN delivery_days INT,
ADD COLUMN delivery_delay_days INT,
ADD COLUMN order_year YEAR,
ADD COLUMN order_month INT,
ADD COLUMN order_quarter INT;

ALTER TABLE order_items
ADD COLUMN total_item_value DECIMAL(10,2);

UPDATE orders SET delivery_days =
DATEDIFF(delivery_date, purchase_date);

UPDATE orders SET delivery_delay_days =
DATEDIFF(delivery_date, estimated_purchase_date);

UPDATE orders SET order_year =
YEAR(purchase_date);

UPDATE orders SET order_month =
MONTH(purchase_date);

UPDATE orders SET order_quarter =
QUARTER(purchase_date);

UPDATE order_items SET total_item_value =
(price + freight_value);
