CREATE TABLE raw.customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT,
	
	PRIMARY KEY (customer_id)
);

CREATE TABLE raw.orders (
	order_id TEXT,
	customer_id TEXT,
	order_status TEXT,
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date TIMESTAMP,
	
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES raw.customers(customer_id)
);

CREATE TABLE raw.order_payments (
	order_id TEXT,
	payment_sequential INTEGER,
	payment_type TEXT,
	payment_installments INTEGER,
	payment_value NUMERIC(10,2),
	
	PRIMARY KEY (order_id, payment_sequential),
	FOREIGN KEY (order_id) REFERENCES raw.orders(order_id)
);

CREATE TABLE raw.geolocations (
	geolocation_zip_code_prefix TEXT,
	geolocation_lat NUMERIC(9,6),
	geolocation_lng NUMERIC(9,6),
	geolocation_city TEXT,
	geolocation_state TEXT
);

CREATE TABLE raw.order_reviews (
	review_id TEXT,
	order_id TEXT,
	review_score INTEGER,
	review_comment_title TEXT,
	review_comment_message TEXT,
	review_creation_date TIMESTAMP,
	review_answer_timestamp TIMESTAMP,
	
	PRIMARY KEY (review_id, order_id)
);

CREATE TABLE raw.products (
	product_id TEXT,
	product_category_name TEXT,
	product_name_lenght INTEGER,
	product_description_lenght INTEGER,
	product_photos_qty INTEGER,
	product_length_cm INTEGER,
	product_height_cm INTEGER,
	product_width_cm INTEGER,
	
	PRIMARY KEY (product_id)
);

ALTER TABLE raw.products ADD COLUMN product_weight_g INTEGER;

CREATE TABLE raw.sellers (
	seller_id TEXT,
	seller_zip_code_prefix TEXT,
	seller_city TEXT,
	seller_state
);
	
ALTER TABLE raw.sellers ADD PRIMARY KEY (seller_id);

CREATE TABLE raw.order_items (
	order_id TEXT,
	order_item_id INTEGER,
	product_id TEXT,
	seller_id TEXT,
	shipping_limit_date TIMESTAMP,
	price NUMERIC(10,2),
	freight_value NUMERIC(10,2),
	
	PRIMARY KEY (order_id, order_item_id),
	FOREIGN KEY (order_id) REFERENCES raw.orders(order_id),
	FOREIGN KEY (product_id) REFERENCES raw.products(product_id),
	FOREIGN KEY (seller_id) REFERENCES raw.sellers(seller_id)
);

CREATE TABLE raw.category_translations (
	product_category_name TEXT,
	product_category_name_english TEXT
);


ALTER TABLE raw.customers
ALTER COLUMN customer_zip_code_prefix TYPE TEXT;