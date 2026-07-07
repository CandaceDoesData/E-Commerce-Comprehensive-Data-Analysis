CREATE VIEW analytics.customer_satisfaction AS

SELECT
    o.order_id,
    o.customer_id,
    o.customer_state,

    r.review_score,
    r.review_comment_title,
    r.review_comment_message,
    r.review_creation_date,

    o.order_delivered_customer_date,
	
    (o.order_delivered_customer_date - o.order_purchase_timestamp) AS delivery_time

FROM analytics.order_summary o

JOIN raw.order_reviews r
    ON o.order_id = r.order_id;
	
	
CREATE OR REPLACE VIEW analytics.customer_satisfaction AS

SELECT
    o.order_id,
    o.customer_id,
    o.customer_state,

    r.review_score,
    r.review_comment_title,
    r.review_comment_message,
    r.review_creation_date,

    o.order_delivered_customer_date,
	
    (o.order_delivered_customer_date - o.order_purchase_timestamp) AS delivery_time

FROM analytics.order_summary_v2 o

JOIN raw.order_reviews r
    ON o.order_id = r.order_id;