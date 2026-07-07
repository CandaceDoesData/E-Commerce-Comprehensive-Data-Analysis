CREATE VIEW analytics.delivery_performance AS

SElECT
    os.order_id,
    os.customer_id,
    os.customer_state,
    os.customer_city,
	
    os.order_purchase_timestamp,
    os.order_delivered_customer_date,
	o.order_estimated_delivery_date,
	
	(os.order_delivered_customer_date - os.order_purchase_timestamp) AS delivery_time,
	
	CASE
		WHEN os.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
		ELSE 0
	END AS is_late
	
FROM analytics.order_summary os
JOIN raw.orders o
	ON os.order_id = o.order_id;


