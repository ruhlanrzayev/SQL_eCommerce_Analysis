-- =============================================
-- 3_fix_categories.sql
-- =============================================

-- which product categories don't exist in categories table
SELECT DISTINCT p.product_category_name
FROM public.products p
LEFT JOIN public.categories c
    ON p.product_category_name = c.product_category_name
WHERE c.product_category_name IS NULL;

-- add missing categories to categories table
INSERT INTO public.categories (product_category_name, product_category_name_english)
SELECT DISTINCT p.product_category_name, p.product_category_name
FROM public.products p
LEFT JOIN public.categories c
    ON p.product_category_name = c.product_category_name
WHERE c.product_category_name IS NULL;

-- check all products now have a matching category
SELECT COUNT(*) AS still_unmatched
FROM public.products p
LEFT JOIN public.categories c
    ON p.product_category_name = c.product_category_name
WHERE c.product_category_name IS NULL;

-- SELECT * FROM public.categories
-- WHERE product_category_name = 'unknown';