-- =============================================
-- Top 10 Product Categories by Revenue --
-- What are the top categories and revenue by total?
-- =============================================

-- price -> order_items
-- categories -> products
    
SELECT 
    categories.product_category_name_english AS categories,
    SUM(order_items.price) AS total_revenue
FROM products
JOIN order_items ON (products.product_id = order_items.product_id)
JOIN categories ON (products.product_category_name = categories.product_category_name)
GROUP BY categories
ORDER BY total_revenue DESC
LIMIT 10

/*

Health & Beauty and Watches & Gifts lead the platform, each generating over $1.2M in revenue, 
followed closely by Bed Bath & Table at just over $1M. These top categories make sense for a Brazilian marketplace — they're high-frequency, 
gift-friendly purchases. The drop-off after the top 3 is gradual rather than sharp, 
showing revenue is fairly distributed across the top 10 rather than dominated by one or two categories.

RESULT:

[
  {
    "categories": "health_beauty",
    "total_revenue": "1258681.34"
  },
  {
    "categories": "watches_gifts",
    "total_revenue": "1205005.68"
  },
  {
    "categories": "bed_bath_table",
    "total_revenue": "1036988.68"
  },
  {
    "categories": "sports_leisure",
    "total_revenue": "988048.97"
  },
  {
    "categories": "computers_accessories",
    "total_revenue": "911954.32"
  },
  {
    "categories": "furniture_decor",
    "total_revenue": "729762.49"
  },
  {
    "categories": "cool_stuff",
    "total_revenue": "635290.85"
  },
  {
    "categories": "housewares",
    "total_revenue": "632248.66"
  },
  {
    "categories": "auto",
    "total_revenue": "592720.11"
  },
  {
    "categories": "garden_tools",
    "total_revenue": "485256.46"
  }
]
*/