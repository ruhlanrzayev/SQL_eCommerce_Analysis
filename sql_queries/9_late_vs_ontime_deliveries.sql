-- =============================================
-- Late vs On-Time Deliveries --
-- What percentage of orders were delivered late vs on time?
-- =============================================

SELECT 
    CASE 
        WHEN order_delivered_customer_date > order_estimated_delivery_date 
        THEN 'late' 
        ELSE 'on_time' 
    END AS delivery_status,
    COUNT(*) AS total_orders,
    CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2), '%') AS percentage
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status
ORDER BY total_orders DESC;


/*

The platform delivers on time for the vast majority of orders — 91.89% (88,649 orders) 
arrived on or before the promised date, while only 8.11% (7,827 orders) were late. 
This is a strong logistics performance, especially considering Brazil's challenging geography and 
the long delivery times we saw earlier for remote states. The relatively low late rate suggests that 
even when deliveries take a long time (like the ~29 days to Roraima), Olist sets realistic delivery 
estimates that account for those distances — they under-promise and over-deliver rather than missing aggressive deadlines.

RESULT: 

[
  {
    "delivery_status": "on_time",
    "total_orders": "88649",
    "percentage": "91.89%"
  },
  {
    "delivery_status": "late",
    "total_orders": "7827",
    "percentage": "8.11%"
  }
]

*/