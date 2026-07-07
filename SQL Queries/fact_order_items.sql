CREATE SCHEMA analytics;

CREATE VIEW analytics.fact_orders AS
SELECT
	o.order_id,
	o.customer_id,
	c.customer_state,
	c.customer_city,
	
	oi.product_id,
	oi.seller_id,
	oi.price,
	oi.freight_value,
	
	o.order_status,
	o.order_purchase_timestamp,
	o.order_delivered_customer_date,
	
	(oi.price + oi.freight_value) AS total_order_value

FROM raw.orders o
JOIN raw.customers c
	ON o.customer_id = c.customer_id
JOIN raw.order_items oi
	ON o.order_id = oi.order_id;
	
	
ALTER VIEW analytics.fact_orders
RENAME TO fact_order_items;

DROP VIEW analytics.fact_order_items;

CREATE VIEW analytics.fact_order_items AS
SELECT
	o.order_id,
	o.customer_id,
	c.customer_state,
	c.customer_city,
	
	oi.product_id,
	oi.seller_id,
	oi.price,
	oi.freight_value,
	
	o.order_status,
	o.order_purchase_timestamp,
	o.order_delivered_customer_date

FROM raw.orders o
JOIN raw.customers c
	ON o.customer_id = c.customer_id
JOIN raw.order_items oi
	ON o.order_id = oi.order_id;