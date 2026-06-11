-- =============================================
-- NULL CHECK --
-- =============================================

-- -- customers - No nulls
-- SELECT
--     COUNT(*) - COUNT(customer_id)              AS null_customer_id,
--     COUNT(*) - COUNT(customer_unique_id)       AS null_customer_unique_id,
--     COUNT(*) - COUNT(customer_zip_code_prefix) AS null_zip,
--     COUNT(*) - COUNT(customer_city)            AS null_city,
--     COUNT(*) - COUNT(customer_state)           AS null_state
-- FROM public.customers;

-- -- orders
-- SELECT
--     COUNT(*) - COUNT(order_id)                      AS null_order_id,
--     COUNT(*) - COUNT(customer_id)                   AS null_customer_id,
--     COUNT(*) - COUNT(order_status)                  AS null_status,
--     COUNT(*) - COUNT(order_purchase_timestamp)      AS null_purchase_ts,
--     COUNT(*) - COUNT(order_approved_at)             AS null_approved,
--     COUNT(*) - COUNT(order_delivered_carrier_date)  AS null_carrier,
--     COUNT(*) - COUNT(order_delivered_customer_date) AS null_delivered,
--     COUNT(*) - COUNT(order_estimated_delivery_date) AS null_estimated
-- FROM public.orders;

-- -- products
-- SELECT
--     COUNT(*) - COUNT(product_id)                 AS null_product_id,
--     COUNT(*) - COUNT(product_category_name)      AS null_category,
--     COUNT(*) - COUNT(product_name_lenght)        AS null_name_length,
--     COUNT(*) - COUNT(product_description_lenght) AS null_desc_length,
--     COUNT(*) - COUNT(product_photos_qty)         AS null_photos,
--     COUNT(*) - COUNT(product_weight_g)           AS null_weight,
--     COUNT(*) - COUNT(product_length_cm)          AS null_length,
--     COUNT(*) - COUNT(product_height_cm)          AS null_height,
--     COUNT(*) - COUNT(product_width_cm)           AS null_width
-- FROM public.products;

-- -- sellers - No Nulls
-- SELECT
--     COUNT(*) - COUNT(seller_id)              AS null_seller_id,
--     COUNT(*) - COUNT(seller_zip_code_prefix) AS null_zip,
--     COUNT(*) - COUNT(seller_city)            AS null_city,
--     COUNT(*) - COUNT(seller_state)           AS null_state
-- FROM public.sellers;

-- -- order_items - No Nulls
-- SELECT
--     COUNT(*) - COUNT(order_id)            AS null_order_id,
--     COUNT(*) - COUNT(order_item_id)       AS null_item_id,
--     COUNT(*) - COUNT(product_id)          AS null_product_id,
--     COUNT(*) - COUNT(seller_id)           AS null_seller_id,
--     COUNT(*) - COUNT(shipping_limit_date) AS null_shipping_date,
--     COUNT(*) - COUNT(price)               AS null_price,
--     COUNT(*) - COUNT(freight_value)       AS null_freight
-- FROM public.order_items;

-- -- order_payments - No Nulls
-- SELECT
--     COUNT(*) - COUNT(order_id)             AS null_order_id,
--     COUNT(*) - COUNT(payment_sequential)   AS null_sequential,
--     COUNT(*) - COUNT(payment_type)         AS null_type,
--     COUNT(*) - COUNT(payment_installments) AS null_installments,
--     COUNT(*) - COUNT(payment_value)        AS null_value
-- FROM public.order_payments;

-- -- reviews
-- SELECT
--     COUNT(*) - COUNT(review_id)               AS null_review_id,
--     COUNT(*) - COUNT(order_id)                AS null_order_id,
--     COUNT(*) - COUNT(review_score)            AS null_score,
--     COUNT(*) - COUNT(review_comment_title)    AS null_title,
--     COUNT(*) - COUNT(review_comment_message)  AS null_message,
--     COUNT(*) - COUNT(review_creation_date)    AS null_creation,
--     COUNT(*) - COUNT(review_answer_timestamp) AS null_answer
-- FROM public.reviews;

-- -- geolocation - No Nulls
-- SELECT
--     COUNT(*) - COUNT(geolocation_zip_code_prefix) AS null_zip,
--     COUNT(*) - COUNT(geolocation_lat)             AS null_lat,
--     COUNT(*) - COUNT(geolocation_lng)             AS null_lng,
--     COUNT(*) - COUNT(geolocation_city)            AS null_city,
--     COUNT(*) - COUNT(geolocation_state)           AS null_state
-- FROM public.geolocation;

-- =============================================
-- 2_handle_nulls.sql
-- =============================================

-- PRODUCTS: fix null category
UPDATE public.products
SET product_category_name = 'unknown'
WHERE product_category_name IS NULL;

-- PRODUCTS: fix null numeric columns
UPDATE public.products
SET
    product_name_lenght        = 0,
    product_description_lenght = 0,
    product_photos_qty         = 0
WHERE product_name_lenght IS NULL;

UPDATE public.products
SET
    product_weight_g   = 0,
    product_length_cm  = 0,
    product_height_cm  = 0,
    product_width_cm   = 0
WHERE product_weight_g IS NULL;

-- REVIEWS: fix null comment title and message
UPDATE public.reviews
SET review_comment_title = 'no title'
WHERE review_comment_title IS NULL;

UPDATE public.reviews
SET review_comment_message = 'no comment'
WHERE review_comment_message IS NULL;

-- SELECT COUNT(*) FROM public.products
-- WHERE product_category_name IS NULL;

-- SELECT COUNT(*) FROM public.products
-- WHERE product_name_lenght IS NULL
--    OR product_weight_g IS NULL;

-- SELECT COUNT(*) FROM public.reviews
-- WHERE review_comment_title IS NULL
--    OR review_comment_message IS NULL;