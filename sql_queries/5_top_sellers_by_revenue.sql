-- =============================================
-- Top 10 Sellers by Total Revenue --
-- Which sellers generate the most revenue on the platform?
-- =============================================

SELECT 
    order_items.seller_id AS sellers,
    ROUND(SUM(order_items.price), 2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10

/*

The top seller generated over $229K in revenue, with the top 10 sellers ranging from $135K to $229K — a relatively 
tight cluster rather than one dominant outlier. This suggests the platform's top revenue isn't concentrated in a single mega-seller 
but spread across a competitive group of high performers. These seller IDs could be cross-referenced with the sellers table to see 
which states/cities the top performers operate from.

RESULT :

[
  {
    "sellers": "4869f7a5dfa277a7dca6462dcf3b52b2",
    "total_revenue": "229472.63"
  },
  {
    "sellers": "53243585a1d6dc2643021fd1853d8905",
    "total_revenue": "222776.05"
  },
  {
    "sellers": "4a3ca9315b744ce9f8e9374361493884",
    "total_revenue": "200472.92"
  },
  {
    "sellers": "fa1c13f2614d7b5c4749cbc52fecda94",
    "total_revenue": "194042.03"
  },
  {
    "sellers": "7c67e1448b00f6e969d365cea6b010ab",
    "total_revenue": "187923.89"
  },
  {
    "sellers": "7e93a43ef30c4f03f38b393420bc753a",
    "total_revenue": "176431.87"
  },
  {
    "sellers": "da8622b14eb17ae2831f4ac5b9dab84a",
    "total_revenue": "160236.57"
  },
  {
    "sellers": "7a67c85e85bb2ce8582c35f2203ad736",
    "total_revenue": "141745.53"
  },
  {
    "sellers": "1025f0e2d44d7041d6cf58b6550e0bfa",
    "total_revenue": "138968.55"
  },
  {
    "sellers": "955fee9216a65b617aa5c0531780ce60",
    "total_revenue": "135171.70"
  }
]

*/

