CREATE VIEW analytics.top_product_categories AS

SELECT
	p.product_category_name AS product_category,
	
	COUNT(*) AS total_items_sold,
	COUNT(DISTINCT f.order_id) AS total_orders,
	
	SUM(f.price) AS product_revenue,
	SUM(f.freight_value) AS freight_revenue,
	SUM(f.price + f.freight_value) AS total_revenue,
	
	AVG(f.price) AS avg_item_price

FROM analytics.fact_order_items f

JOIN raw.products p
	ON f.product_id = p.product_id

GROUP BY p.product_category_name

ORDER BY total_revenue DESC;