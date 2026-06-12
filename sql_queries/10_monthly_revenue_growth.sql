-- =============================================
-- Monthly Revenue Growth --
-- What is the month-over-month revenue growth rate?
-- =============================================

-- Date -> orders
-- Prices -> order_items

WITH total_revenue_per_month AS (
    SELECT 
        DATE_TRUNC('month', orders.order_purchase_timestamp)::DATE AS months,
        COUNT(DISTINCT orders.order_id) AS total_orders,
        SUM(order_items.price) AS total_revenue
    FROM orders 
    JOIN order_items ON orders.order_id = order_items.order_id
    WHERE orders.order_purchase_timestamp >= '2017-01-01'
    GROUP BY months
)

SELECT
    months,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY months) AS previous_revenue,
    CONCAT(ROUND(
        (total_revenue - LAG(total_revenue) OVER (ORDER BY months)) * 100.0
        / LAG(total_revenue) OVER (ORDER BY months)
    , 2), '%') AS growth_percentage
FROM total_revenue_per_month

/*

After filtering out the unreliable pilot months, the platform shows healthy and realistic month-over-month growth throughout 2017-2018. 
The standout is November 2017 with +52% growth (Black Friday), followed by the typical December drop (-26%) as post-holiday spending cools. 
Throughout 2018 the business matures — growth swings become smaller and more stable (mostly between -13% and +28%), which is exactly what 
you'd expect from a platform moving from explosive early growth into steady maturity.

RESULT:

[
  {
    "months": "2017-01-01",
    "total_revenue": "120312.87",
    "previous_revenue": null,
    "growth_percentage": "%"
  },
  {
    "months": "2017-02-01",
    "total_revenue": "247303.02",
    "previous_revenue": "120312.87",
    "growth_percentage": "105.55%"
  },
  {
    "months": "2017-03-01",
    "total_revenue": "374344.30",
    "previous_revenue": "247303.02",
    "growth_percentage": "51.37%"
  },
  {
    "months": "2017-04-01",
    "total_revenue": "359927.23",
    "previous_revenue": "374344.30",
    "growth_percentage": "-3.85%"
  },
  {
    "months": "2017-05-01",
    "total_revenue": "506071.14",
    "previous_revenue": "359927.23",
    "growth_percentage": "40.60%"
  },
  {
    "months": "2017-06-01",
    "total_revenue": "433038.60",
    "previous_revenue": "506071.14",
    "growth_percentage": "-14.43%"
  },
  {
    "months": "2017-07-01",
    "total_revenue": "498031.48",
    "previous_revenue": "433038.60",
    "growth_percentage": "15.01%"
  },
  {
    "months": "2017-08-01",
    "total_revenue": "573971.68",
    "previous_revenue": "498031.48",
    "growth_percentage": "15.25%"
  },
  {
    "months": "2017-09-01",
    "total_revenue": "624401.69",
    "previous_revenue": "573971.68",
    "growth_percentage": "8.79%"
  },
  {
    "months": "2017-10-01",
    "total_revenue": "664219.43",
    "previous_revenue": "624401.69",
    "growth_percentage": "6.38%"
  },
  {
    "months": "2017-11-01",
    "total_revenue": "1010271.37",
    "previous_revenue": "664219.43",
    "growth_percentage": "52.10%"
  },
  {
    "months": "2017-12-01",
    "total_revenue": "743914.17",
    "previous_revenue": "1010271.37",
    "growth_percentage": "-26.36%"
  },
  {
    "months": "2018-01-01",
    "total_revenue": "950030.36",
    "previous_revenue": "743914.17",
    "growth_percentage": "27.71%"
  },
  {
    "months": "2018-02-01",
    "total_revenue": "844178.71",
    "previous_revenue": "950030.36",
    "growth_percentage": "-11.14%"
  },
  {
    "months": "2018-03-01",
    "total_revenue": "983213.44",
    "previous_revenue": "844178.71",
    "growth_percentage": "16.47%"
  },
  {
    "months": "2018-04-01",
    "total_revenue": "996647.75",
    "previous_revenue": "983213.44",
    "growth_percentage": "1.37%"
  },
  {
    "months": "2018-05-01",
    "total_revenue": "996517.68",
    "previous_revenue": "996647.75",
    "growth_percentage": "-0.01%"
  },
  {
    "months": "2018-06-01",
    "total_revenue": "865124.31",
    "previous_revenue": "996517.68",
    "growth_percentage": "-13.19%"
  },
  {
    "months": "2018-07-01",
    "total_revenue": "895507.22",
    "previous_revenue": "865124.31",
    "growth_percentage": "3.51%"
  },
  {
    "months": "2018-08-01",
    "total_revenue": "854686.33",
    "previous_revenue": "895507.22",
    "growth_percentage": "-4.56%"
  },
  {
    "months": "2018-09-01",
    "total_revenue": "145.00",
    "previous_revenue": "854686.33",
    "growth_percentage": "-99.98%"
  }
]

*/
