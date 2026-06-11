-- =============================================
-- DUPLICATE CHECK --
-- =============================================

-- -- Categories
-- SELECT product_category_name, COUNT(*) 
-- FROM public.categories
-- GROUP BY product_category_name
-- HAVING COUNT(*) > 1;

-- -- Customers
-- SELECT customer_id, COUNT(*) 
-- FROM public.customers
-- GROUP BY customer_id
-- HAVING COUNT(*) > 1;

-- -- Orders
-- SELECT order_id, COUNT(*) 
-- FROM public.orders
-- GROUP BY order_id
-- HAVING COUNT(*) > 1;

-- -- Reviews
-- SELECT review_id, COUNT(*) 
-- FROM public.reviews
-- GROUP BY review_id
-- HAVING COUNT(*) > 1;

-- -- Products
-- SELECT product_id, COUNT(*) 
-- FROM public.products
-- GROUP BY product_id
-- HAVING COUNT(*) > 1;

-- -- Sellers
-- SELECT seller_id, COUNT(*) 
-- FROM public.sellers
-- GROUP BY seller_id
-- HAVING COUNT(*) > 1;

-- -- Geolocation 
-- SELECT geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, 
--        geolocation_city, geolocation_state, COUNT(*)
-- FROM public.geolocation
-- GROUP BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng,
--          geolocation_city, geolocation_state
-- HAVING COUNT(*) > 1;

-- -- Order Items 
-- SELECT order_id, order_item_id, COUNT(*)
-- FROM public.order_items
-- GROUP BY order_id, order_item_id
-- HAVING COUNT(*) > 1;

-- -- Order Payments 
-- SELECT order_id, payment_sequential, COUNT(*)
-- FROM public.order_payments
-- GROUP BY order_id, payment_sequential
-- HAVING COUNT(*) > 1;

-- =============================================
-- 1_remove_duplicates.sql
-- =============================================

-- CUSTOMERS: keep first occurrence per customer_id
DELETE FROM public.customers
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.customers
    GROUP BY customer_id
);

-- REVIEWS: keep first occurrence per review_id
DELETE FROM public.reviews
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.reviews
    GROUP BY review_id
);

-- CATEGORIES: keep first occurrence per category name
DELETE FROM public.categories
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.categories
    GROUP BY product_category_name
);

-- ORDERS: keep first occurrence per order_id
DELETE FROM public.orders
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.orders
    GROUP BY order_id
);

-- PRODUCTS
DELETE FROM public.products
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.products
    GROUP BY product_id
);

-- SELLERS
DELETE FROM public.sellers
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.sellers
    GROUP BY seller_id
);

-- ORDER_ITEMS
DELETE FROM public.order_items
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.order_items
    GROUP BY order_id, order_item_id
);

-- ORDER_PAYMENTS
DELETE FROM public.order_payments
WHERE ctid NOT IN (
    SELECT MIN(ctid)
    FROM public.order_payments
    GROUP BY order_id, payment_sequential
);

-- GEOLOCATION
DELETE FROM public.geolocation
WHERE ctid IN (
    SELECT ctid FROM (
        SELECT ctid,
               ROW_NUMBER() OVER (
                   PARTITION BY geolocation_zip_code_prefix,
                                geolocation_lat,
                                geolocation_lng,
                                geolocation_city,
                                geolocation_state
                   ORDER BY ctid
               ) AS rn
        FROM public.geolocation
    ) t
    WHERE rn > 1
);

-- It shows how much row are there after cleaning.
SELECT 'categories'     AS table_name, COUNT(*) AS row_count FROM public.categories
UNION ALL
SELECT 'customers',      COUNT(*) FROM public.customers
UNION ALL
SELECT 'geolocation',    COUNT(*) FROM public.geolocation
UNION ALL
SELECT 'sellers',        COUNT(*) FROM public.sellers
UNION ALL
SELECT 'products',       COUNT(*) FROM public.products
UNION ALL
SELECT 'orders',         COUNT(*) FROM public.orders
UNION ALL
SELECT 'order_items',    COUNT(*) FROM public.order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM public.order_payments
UNION ALL
SELECT 'reviews',        COUNT(*) FROM public.reviews;