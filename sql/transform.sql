DROP TABLE olist_geolocation_dataset;
DROP TABLE olist_order_reviews_dataset;
DROP TABLE product_category_name_translation;

RENAME TABLE olist_customers_dataset TO customers;
RENAME TABLE olist_order_items_dataset TO order_items;
RENAME TABLE olist_order_payments_dataset TO order_payments;
RENAME TABLE olist_orders_dataset TO orders;
RENAME TABLE olist_products_dataset TO products;
RENAME TABLE olist_sellers_dataset TO sellers;

ALTER TABLE orders
DROP COLUMN order_approved_at,
DROP COLUMN order_delivered_carrier_date;

ALTER TABLE orders
ADD COLUMN purchase_date DATE,
ADD COLUMN delivery_date DATE,
ADD COLUMN estimated_purchase_date DATE;

UPDATE orders SET purchase_date =
DATE(order_purchase_timestamp);

UPDATE orders SET delivery_date =
DATE(order_delivered_customer_date);

UPDATE orders SET estimated_purchase_date =
DATE(order_estimated_delivery_date);

ALTER TABLE orders
DROP COLUMN order_purchase_timestamp,
DROP COLUMN order_delivered_customer_date,
DROP COLUMN order_estimated_delivery_date;

ALTER TABLE order_items
DROP COLUMN order_item_id,
DROP COLUMN shipping_limit_date;

ALTER TABLE order_payments
DROP COLUMN payment_sequential;

ALTER TABLE products
DROP COLUMN product_name_lenght,
DROP COLUMN product_description_lenght,
DROP COLUMN product_photos_qty,
DROP COLUMN product_weight_g,
DROP COLUMN product_length_cm,
DROP COLUMN product_height_cm,
DROP COLUMN product_width_cm;

ALTER TABLE products
RENAME COLUMN product_category_name TO product_category;

ALTER TABLE sellers
DROP COLUMN seller_zip_code_prefix;

ALTER TABLE customers
DROP COLUMN customer_unique_id,
DROP COLUMN customer_zip_code_prefix;
