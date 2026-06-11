-- =============================================
-- 2_create_tables.sql
-- =============================================

CREATE TABLE public.categories (
    product_category_name         VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

CREATE TABLE public.customers (
    customer_id              VARCHAR(50) PRIMARY KEY,
    customer_unique_id       VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city            VARCHAR(100),
    customer_state           CHAR(2)
);

CREATE TABLE public.geolocation (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat             DECIMAL(18,15),
    geolocation_lng             DECIMAL(18,15),
    geolocation_city            VARCHAR(100),
    geolocation_state           CHAR(2)
);

CREATE TABLE public.sellers (
    seller_id              VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(10),
    seller_city            VARCHAR(100),
    seller_state           CHAR(2)
);

CREATE TABLE public.products (
    product_id                   VARCHAR(50) PRIMARY KEY,
    product_category_name        VARCHAR(100),
    product_name_lenght          INT,
    product_description_lenght   INT,
    product_photos_qty           INT,
    product_weight_g             INT,
    product_length_cm            INT,
    product_height_cm            INT,
    product_width_cm             INT
);

CREATE TABLE public.orders (
    order_id                      VARCHAR(50) PRIMARY KEY,
    customer_id                   VARCHAR(50),
    order_status                  VARCHAR(30),
    order_purchase_timestamp      TIMESTAMP,
    order_approved_at             TIMESTAMP,
    order_delivered_carrier_date  TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE public.order_items (
    order_id            VARCHAR(50),
    order_item_id       INT,
    product_id          VARCHAR(50),
    seller_id           VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price               DECIMAL(10,2),
    freight_value       DECIMAL(10,2),
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE public.order_payments (
    order_id             VARCHAR(50),
    payment_sequential   INT,
    payment_type         VARCHAR(50),
    payment_installments INT,
    payment_value        DECIMAL(10,2),
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE public.reviews (
    review_id              VARCHAR(50) PRIMARY KEY,
    order_id               VARCHAR(50),
    review_score           INT,
    review_comment_title   VARCHAR(100),
    review_comment_message TEXT,
    review_creation_date   TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- =============================================
-- FOREIGN KEYS
-- =============================================

ALTER TABLE public.customers OWNER TO postgres;

ALTER TABLE public.orders
    ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);

ALTER TABLE public.order_items
    ADD CONSTRAINT fk_orderitems_order
    FOREIGN KEY (order_id) REFERENCES public.orders(order_id);

ALTER TABLE public.order_items
    ADD CONSTRAINT fk_orderitems_product
    FOREIGN KEY (product_id) REFERENCES public.products(product_id);

ALTER TABLE public.order_items
    ADD CONSTRAINT fk_orderitems_seller
    FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);

ALTER TABLE public.order_payments
    ADD CONSTRAINT fk_payments_order
    FOREIGN KEY (order_id) REFERENCES public.orders(order_id);

ALTER TABLE public.reviews
    ADD CONSTRAINT fk_reviews_order
    FOREIGN KEY (order_id) REFERENCES public.orders(order_id);

ALTER TABLE public.products
    ADD CONSTRAINT fk_products_category
    FOREIGN KEY (product_category_name) REFERENCES public.categories(product_category_name);

-- =============================================
-- OWNERSHIP
-- =============================================

ALTER TABLE public.categories     OWNER TO postgres;
ALTER TABLE public.customers      OWNER TO postgres;
ALTER TABLE public.geolocation    OWNER TO postgres;
ALTER TABLE public.sellers        OWNER TO postgres;
ALTER TABLE public.products       OWNER TO postgres;
ALTER TABLE public.orders         OWNER TO postgres;
ALTER TABLE public.order_items    OWNER TO postgres;
ALTER TABLE public.order_payments OWNER TO postgres;
ALTER TABLE public.reviews        OWNER TO postgres;

-- =============================================
-- INDEXES
-- =============================================

-- Orders
CREATE INDEX idx_orders_customer_id   ON public.orders(customer_id);
CREATE INDEX idx_orders_status        ON public.orders(order_status);
CREATE INDEX idx_orders_purchase_date ON public.orders(order_purchase_timestamp);

-- Order Items
CREATE INDEX idx_order_items_product  ON public.order_items(product_id);
CREATE INDEX idx_order_items_seller   ON public.order_items(seller_id);

-- Order Payments
CREATE INDEX idx_payments_type        ON public.order_payments(payment_type);

-- Reviews
CREATE INDEX idx_reviews_order        ON public.reviews(order_id);
CREATE INDEX idx_reviews_score        ON public.reviews(review_score);

-- Products
CREATE INDEX idx_products_category    ON public.products(product_category_name);

-- Customers
CREATE INDEX idx_customers_state ON public.customers(customer_state);
CREATE INDEX idx_customers_city  ON public.customers(customer_city);

-- Geolocation
CREATE INDEX idx_geolocation_zip      ON public.geolocation(geolocation_zip_code_prefix);

-- Sellers
CREATE INDEX idx_sellers_state        ON public.sellers(seller_state);