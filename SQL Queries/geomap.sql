CREATE VIEW analytics.geo_map AS

SELECT
	
	c.customer_zip_code_prefix,
	c.customer_city,
   	c.customer_state,
    AVG(g.geolocation_lat) AS latitude,
    AVG(g.geolocation_lng) AS longitude,
    COUNT(DISTINCT c.customer_unique_id) AS customer_count
	
FROM raw.customers c

JOIN raw.geolocations g
    ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix

GROUP BY customer_state;