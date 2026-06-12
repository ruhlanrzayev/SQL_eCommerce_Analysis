-- =============================================
-- Monthly Orders & Revenue --
-- What are the total orders and revenue by month?
-- =============================================
    
-- prices -> order_items
-- date and all orders -> orders
SELECT 
    DATE_TRUNC('month', orders.order_purchase_timestamp)::DATE AS months,
    COUNT(DISTINCT orders.order_id) AS total_orders,
    SUM(order_items.price) AS total_revenue
FROM orders 
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY months
ORDER BY months;


/*

The platform shows steady growth from late 2016 through 2018, 
with November 2017 being the standout month at 7,451 orders and over $1M in 
revenue — likely driven by Black Friday seasonal demand. Early months (Sept-Dec 2016) show very low activity, 
consistent with this being the platform's early pilot phase. Order volume and revenue generally track together month-to-month, 
suggesting consistent average order values rather than wild pricing swings.

RESULT:

[
  {
    "months": "2016-09-01",
    "total_orders": "3",
    "total_revenue": "267.36"
  },
  {
    "months": "2016-10-01",
    "total_orders": "308",
    "total_revenue": "49507.66"
  },
  {
    "months": "2016-12-01",
    "total_orders": "1",
    "total_revenue": "10.90"
  },
  {
    "months": "2017-01-01",
    "total_orders": "789",
    "total_revenue": "120312.87"
  },
  {
    "months": "2017-02-01",
    "total_orders": "1733",
    "total_revenue": "247303.02"
  },
  {
    "months": "2017-03-01",
    "total_orders": "2641",
    "total_revenue": "374344.30"
  },
  {
    "months": "2017-04-01",
    "total_orders": "2391",
    "total_revenue": "359927.23"
  },
  {
    "months": "2017-05-01",
    "total_orders": "3660",
    "total_revenue": "506071.14"
  },
  {
    "months": "2017-06-01",
    "total_orders": "3217",
    "total_revenue": "433038.60"
  },
  {
    "months": "2017-07-01",
    "total_orders": "3969",
    "total_revenue": "498031.48"
  },
  {
    "months": "2017-08-01",
    "total_orders": "4293",
    "total_revenue": "573971.68"
  },
  {
    "months": "2017-09-01",
    "total_orders": "4243",
    "total_revenue": "624401.69"
  },
  {
    "months": "2017-10-01",
    "total_orders": "4568",
    "total_revenue": "664219.43"
  },
  {
    "months": "2017-11-01",
    "total_orders": "7451",
    "total_revenue": "1010271.37"
  },
  {
    "months": "2017-12-01",
    "total_orders": "5624",
    "total_revenue": "743914.17"
  },
  {
    "months": "2018-01-01",
    "total_orders": "7220",
    "total_revenue": "950030.36"
  },
  {
    "months": "2018-02-01",
    "total_orders": "6694",
    "total_revenue": "844178.71"
  },
  {
    "months": "2018-03-01",
    "total_orders": "7188",
    "total_revenue": "983213.44"
  },
  {
    "months": "2018-04-01",
    "total_orders": "6934",
    "total_revenue": "996647.75"
  },
  {
    "months": "2018-05-01",
    "total_orders": "6853",
    "total_revenue": "996517.68"
  },
  {
    "months": "2018-06-01",
    "total_orders": "6160",
    "total_revenue": "865124.31"
  },
  {
    "months": "2018-07-01",
    "total_orders": "6273",
    "total_revenue": "895507.22"
  },
  {
    "months": "2018-08-01",
    "total_orders": "6452",
    "total_revenue": "854686.33"
  },
  {
    "months": "2018-09-01",
    "total_orders": "1",
    "total_revenue": "145.00"
  }
]
*/