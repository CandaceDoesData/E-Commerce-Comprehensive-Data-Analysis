CREATE VIEW analytics.top_sellers AS

SELECT
	f.seller_id,
	
	COUNT(*) AS total_items_sold,
	COUNT(DISTINCT f.order_id) AS total_orders,
	
	SUM(f.price) AS product_revenue,
	SUM(f.freight_value) AS freight_revenue,
	SUM(f.price + f.freight_value) AS total_revenue,
	
	AVG(f.price) AS avg_item_price

FROM analytics.fact_order_items f

GROUP BY f.seller_id

ORDER BY total_revenue DESC;