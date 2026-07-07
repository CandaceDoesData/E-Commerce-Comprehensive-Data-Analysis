CREATE VIEW analytics.executive_kpis AS

SELECT
	COUNT(order_id) AS total_orders,
	COUNT(DISTINCT customer_id) AS total_customers,
	
	SUM(total_product_revenue) AS total_product_revenue,
	SUM(total_freight) AS total_freight,
	SUM(total_order_value) AS total_order_value,
	
	AVG(total_order_value) AS avg_order_value

FROM analytics.order_summary;

CREATE VIEW analytics.executive_kpis AS

SELECT
	COUNT(order_id) AS total_orders,
	COUNT(DISTINCT customer_id) AS total_customers,
	
	SUM(total_product_revenue) AS total_product_revenue,
	SUM(total_freight) AS total_freight,
	SUM(total_order_value) AS total_order_value,
	
	AVG(total_order_value) AS avg_order_value

FROM analytics.order_summary;

CREATE OR REPLACE VIEW analytics.executive_kpis AS

SELECT
	COUNT(order_id) AS total_orders,
	COUNT(DISTINCT customer_unique_id) AS total_customers,
	
	SUM(total_product_revenue) AS total_product_revenue,
	SUM(total_freight) AS total_freight,
	SUM(total_order_value) AS total_order_value,
	
	AVG(total_order_value) AS avg_order_value

FROM analytics.order_summary_v2;

