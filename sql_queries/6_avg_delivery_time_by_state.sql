-- =============================================
-- Average Delivery Time by Customer State --
-- For each customer state, how many days does delivery take on average?
-- =============================================

-- Orders -> orders
-- Customers -> customers

SELECT 
    customers.customer_state AS state,
    ROUND(AVG(EXTRACT(DAY FROM (orders.order_delivered_customer_date - orders.order_purchase_timestamp))), 2) AS avg_delivery_days
FROM orders
JOIN customers ON (orders.customer_id = customers.customer_id)
WHERE orders.order_delivered_customer_date IS NOT NULL
GROUP BY state 
ORDER BY avg_delivery_days


/*

São Paulo (SP) has by far the fastest deliveries at just 8.3 days — which makes sense since it's the economic 
hub where most sellers are based, so packages travel short distances. Delivery times climb steadily as you move 
toward the remote northern states, peaking at Roraima (RR) at nearly 29 days — over 3x slower than SP. 
The pattern clearly reflects Brazil's geography: the densely populated, seller-heavy southeast gets quick delivery, 
while the vast, remote Amazon-region states (AM, AP, RR) face the longest waits due to distance and limited logistics infrastructure.

RESULT :

[
  {
    "state": "SP",
    "avg_delivery_days": "8.30"
  },
  {
    "state": "PR",
    "avg_delivery_days": "11.53"
  },
  {
    "state": "MG",
    "avg_delivery_days": "11.54"
  },
  {
    "state": "DF",
    "avg_delivery_days": "12.51"
  },
  {
    "state": "SC",
    "avg_delivery_days": "14.48"
  },
  {
    "state": "RS",
    "avg_delivery_days": "14.82"
  },
  {
    "state": "RJ",
    "avg_delivery_days": "14.85"
  },
  {
    "state": "GO",
    "avg_delivery_days": "15.15"
  },
  {
    "state": "MS",
    "avg_delivery_days": "15.19"
  },
  {
    "state": "ES",
    "avg_delivery_days": "15.33"
  },
  {
    "state": "TO",
    "avg_delivery_days": "17.23"
  },
  {
    "state": "MT",
    "avg_delivery_days": "17.59"
  },
  {
    "state": "PE",
    "avg_delivery_days": "17.97"
  },
  {
    "state": "RN",
    "avg_delivery_days": "18.82"
  },
  {
    "state": "BA",
    "avg_delivery_days": "18.87"
  },
  {
    "state": "RO",
    "avg_delivery_days": "18.91"
  },
  {
    "state": "PI",
    "avg_delivery_days": "18.99"
  },
  {
    "state": "PB",
    "avg_delivery_days": "19.95"
  },
  {
    "state": "AC",
    "avg_delivery_days": "20.64"
  },
  {
    "state": "CE",
    "avg_delivery_days": "20.82"
  },
  {
    "state": "SE",
    "avg_delivery_days": "21.03"
  },
  {
    "state": "MA",
    "avg_delivery_days": "21.12"
  },
  {
    "state": "PA",
    "avg_delivery_days": "23.32"
  },
  {
    "state": "AL",
    "avg_delivery_days": "24.04"
  },
  {
    "state": "AM",
    "avg_delivery_days": "25.99"
  },
  {
    "state": "AP",
    "avg_delivery_days": "26.73"
  },
  {
    "state": "RR",
    "avg_delivery_days": "28.98"
  }
]

*/