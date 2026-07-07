CREATE VIEW analytics.order_summary AS
SELECT 
	o.order_id,
	o.customer_id,
	c.customer_state,
	c.customer_city,
	
	o.order_status,
	o.order_purchase_timestamp,
	o.order_delivered_customer_date,
	
	COUNT(DISTINCT oi.order_item_id) AS total_items,
	SUM(oi.price) AS total_product_revenue,
	SUM(oi.freight_value) AS total_freight,
	SUM(oi.price + oi.freight_value) AS total_order_value
	
FROM raw.orders o
JOIN raw.customers c
	ON o.customer_id = c.customer_id
JOIN raw.order_items oi
	ON o.order_id = oi.order_id
	
GROUP BY o.order_id,
		o.customer_id,
		c.customer_state,
		c.customer_city,
		o.order_status,
		o.order_purchase_timestamp,
		o.order_delivered_customer_date;
		

CREATE VIEW analytics.order_summary_v2 AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_state,
    c.customer_city,

    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,

    COUNT(oi.order_item_id) AS total_items,
    SUM(oi.price) AS total_product_revenue,
    SUM(oi.freight_value) AS total_freight,
    SUM(oi.price + oi.freight_value) AS total_order_value

FROM raw.orders o

JOIN raw.customers c
    ON o.customer_id = c.customer_id

JOIN raw.order_items oi
    ON o.order_id = oi.order_id

GROUP BY
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_state,
    c.customer_city,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date;