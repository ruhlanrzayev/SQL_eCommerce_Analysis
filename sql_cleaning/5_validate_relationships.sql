-- =============================================
-- 5_validate_relationships.sql
-- =============================================

-- order_items with no matching order
SELECT COUNT(*) AS orphan_order_items
FROM public.order_items oi
LEFT JOIN public.orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- order_payments with no matching order
SELECT COUNT(*) AS orphan_order_payments
FROM public.order_payments op
LEFT JOIN public.orders o ON op.order_id = o.order_id
WHERE o.order_id IS NULL;

-- reviews with no matching order
SELECT COUNT(*) AS orphan_reviews
FROM public.reviews r
LEFT JOIN public.orders o ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

-- orders with no matching customer
SELECT COUNT(*) AS orphan_orders
FROM public.orders o
LEFT JOIN public.customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- order_items with no matching product
SELECT COUNT(*) AS orphan_items_no_product
FROM public.order_items oi
LEFT JOIN public.products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- order_items with no matching seller
SELECT COUNT(*) AS orphan_items_no_seller
FROM public.order_items oi
LEFT JOIN public.sellers s ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;