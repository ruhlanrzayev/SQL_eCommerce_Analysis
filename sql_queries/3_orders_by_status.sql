-- =============================================
-- Order Count by Status --
-- How many orders fall into each order status?
-- =============================================

-- Order Status - orders

SELECT 
    order_status,
    COUNT(order_status) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC

/*

The vast majority of orders (96,478 out of ~99,441, roughly 97%) were successfully delivered, 
indicating a healthy and reliable fulfillment operation. Cancellations (625) and unavailable items (609) 
each represent less than 1% of total orders — both relatively low and 
not a major operational concern. The remaining statuses 
(shipped, invoiced, processing, created, approved) represent a tiny fraction, likely orders that were near 
the end of the dataset's time window and hadn't completed their lifecycle yet.

RESULT:

[
  {
    "order_status": "delivered",
    "total_orders": "96478"
  },
  {
    "order_status": "shipped",
    "total_orders": "1107"
  },
  {
    "order_status": "canceled",
    "total_orders": "625"
  },
  {
    "order_status": "unavailable",
    "total_orders": "609"
  },
  {
    "order_status": "invoiced",
    "total_orders": "314"
  },
  {
    "order_status": "processing",
    "total_orders": "301"
  },
  {
    "order_status": "created",
    "total_orders": "5"
  },
  {
    "order_status": "approved",
    "total_orders": "2"
  }
]

*/