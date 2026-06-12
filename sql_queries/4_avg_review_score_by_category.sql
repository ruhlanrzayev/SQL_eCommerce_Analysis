-- =============================================
-- Average Review Score per Product Category --
-- What is the average review score for each product category?
-- =============================================~


-- Reviews -> reviews
-- Orders -> Orders_Items
-- Products -> Products
-- Categories -> Categories

SELECT 
    categories.product_category_name_english AS categories,
    ROUND(AVG(review_score), 2) AS average_review
FROM reviews
JOIN order_items ON (reviews.order_id = order_items.order_id)
JOIN products ON (products.product_id = order_items.product_id)
JOIN categories ON (products.product_category_name = categories.product_category_name)
GROUP BY categories
ORDER BY average_review DESC
LIMIT 15


/*

The highest-rated categories are CDs/DVDs/Musicals (4.64) and Fashion Children's Clothes (4.50), 
with most top categories scoring in the 4.2-4.5 range — generally positive sentiment across the board. 
Niche, low-volume categories (books, music, flowers) tend to dominate the top, 
possibly because customers who buy these are more passionate/satisfied, or simply because fewer reviews 
mean less chance of an outlier negative experience pulling the average down.

RESULT: 
[
  {
    "categories": "cds_dvds_musicals",
    "average_review": "4.64"
  },
  {
    "categories": "fashion_childrens_clothes",
    "average_review": "4.50"
  },
  {
    "categories": "books_general_interest",
    "average_review": "4.45"
  },
  {
    "categories": "costruction_tools_tools",
    "average_review": "4.44"
  },
  {
    "categories": "flowers",
    "average_review": "4.42"
  },
  {
    "categories": "books_imported",
    "average_review": "4.40"
  },
  {
    "categories": "books_technical",
    "average_review": "4.36"
  },
  {
    "categories": "food_drink",
    "average_review": "4.31"
  },
  {
    "categories": "luggage_accessories",
    "average_review": "4.31"
  },
  {
    "categories": "small_appliances_home_oven_and_coffee",
    "average_review": "4.30"
  },
  {
    "categories": "fashion_shoes",
    "average_review": "4.25"
  },
  {
    "categories": "fashion_sport",
    "average_review": "4.23"
  },
  {
    "categories": "food",
    "average_review": "4.23"
  },
  {
    "categories": "cine_photo",
    "average_review": "4.21"
  },
  {
    "categories": "music",
    "average_review": "4.21"
  }
]

*/