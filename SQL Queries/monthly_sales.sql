CREATE VIEW analytics.monthly_sales AS

SELECT

	DATE_TRUNC('month', order_purchase_timestamp) AS month,
	
	COUNT(order_id) AS total_orders,
	
	SUM(total_product_revenue) AS total_product_revenue,
	SUM(total_freight) AS total_freight,
	SUM(total_order_value) AS total_order_value,
	
	AVG(total_order_value) AS avg_order_value

FROM analytics.order_summary
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY month;


CREATE OR REPLACE VIEW analytics.monthly_sales AS

SELECT

	DATE_TRUNC('month', order_purchase_timestamp) AS month,
	
	COUNT(order_id) AS total_orders,
	
	SUM(total_product_revenue) AS total_product_revenue,
	SUM(total_freight) AS total_freight,
	SUM(total_order_value) AS total_order_value,
	
	AVG(total_order_value) AS avg_order_value

FROM analytics.order_summary_v2
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY month;