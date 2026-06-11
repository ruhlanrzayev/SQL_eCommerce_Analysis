-- =============================================
-- 4_standardize_text.sql
-- =============================================

-- CUSTOMERS
UPDATE public.customers
SET
    customer_city  = LOWER(TRIM(customer_city)),
    customer_state = UPPER(TRIM(customer_state));

-- SELLERS
UPDATE public.sellers
SET
    seller_city  = LOWER(TRIM(seller_city)),
    seller_state = UPPER(TRIM(seller_state));

-- GEOLOCATION
UPDATE public.geolocation
SET
    geolocation_city  = LOWER(TRIM(geolocation_city)),
    geolocation_state = UPPER(TRIM(geolocation_state));

-- PRODUCTS
UPDATE public.products
SET product_category_name = LOWER(TRIM(product_category_name));

-- CATEGORIES
UPDATE public.categories
SET
    product_category_name         = LOWER(TRIM(product_category_name)),
    product_category_name_english = LOWER(TRIM(product_category_name_english));

-- ORDERS
UPDATE public.orders
SET order_status = LOWER(TRIM(order_status));

-- ORDER_PAYMENTS
UPDATE public.order_payments
SET payment_type = LOWER(TRIM(payment_type));

-- REVIEWS
UPDATE public.reviews
SET
    review_comment_title   = LOWER(TRIM(review_comment_title)),
    review_comment_message = LOWER(TRIM(review_comment_message));