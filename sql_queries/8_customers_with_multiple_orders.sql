-- =============================================
-- Customers With Multiple Orders --
-- Which customers placed more than one order?
-- =============================================

-- Orders -> orders

SELECT 
    customers.customer_unique_id AS customers,
    COUNT(order_id) AS total_orders
FROM orders
JOIN customers ON (orders.customer_id = customers.customer_id)
GROUP BY customers 
HAVING COUNT(order_id) > 1
ORDER BY total_orders  DESC
LIMIT 25


/*

Once we use the correct identifier (customer_unique_id rather than the per-order customer_id), 
we find genuine repeat buyers — the top customer placed 17 orders, with a small group of loyal 
customers placing 5-9 orders each. However, repeat customers are relatively rare overall, 
which is typical for this marketplace — most customers buy once. This highlights a potential business opportunity: 
even small improvements in customer retention could significantly impact revenue, since acquiring new customers is far more expensive than retaining existing ones.

RESULT:

[
  {
    "customers": "8d50f5eadf50201ccdcedfb9e2ac8455",
    "total_orders": "17"
  },
  {
    "customers": "3e43e6105506432c953e165fb2acf44c",
    "total_orders": "9"
  },
  {
    "customers": "6469f99c1f9dfae7733b25662e7f1782",
    "total_orders": "7"
  },
  {
    "customers": "ca77025e7201e3b30c44b472ff346268",
    "total_orders": "7"
  },
  {
    "customers": "1b6c7548a2a1f9037c1fd3ddfed95f33",
    "total_orders": "7"
  },
  {
    "customers": "dc813062e0fc23409cd255f7f53c7074",
    "total_orders": "6"
  },
  {
    "customers": "63cfc61cee11cbe306bff5857d00bfe4",
    "total_orders": "6"
  },
  {
    "customers": "f0e310a6839dce9de1638e0fe5ab282a",
    "total_orders": "6"
  },
  {
    "customers": "47c1a3033b8b77b3ab6e109eb4d5fdf3",
    "total_orders": "6"
  },
  {
    "customers": "12f5d6e1cbf93dafd9dcc19095df0b3d",
    "total_orders": "6"
  },
  {
    "customers": "de34b16117594161a6a89c50b289d35a",
    "total_orders": "6"
  },
  {
    "customers": "74cb1ad7e6d5674325c1f99b5ea30d82",
    "total_orders": "5"
  },
  {
    "customers": "4e65032f1f574189fb793bac5a867bbc",
    "total_orders": "5"
  },
  {
    "customers": "56c8638e7c058b98aae6d74d2dd6ea23",
    "total_orders": "5"
  },
  {
    "customers": "394ac4de8f3acb14253c177f0e15bc58",
    "total_orders": "5"
  },
  {
    "customers": "b4e4f24de1e8725b74e4a1f4975116ed",
    "total_orders": "5"
  },
  {
    "customers": "5e8f38a9a1c023f3db718edcf926a2db",
    "total_orders": "5"
  },
  {
    "customers": "35ecdf6858edc6427223b64804cf028e",
    "total_orders": "5"
  },
  {
    "customers": "fe81bb32c243a86b2f86fbf053fe6140",
    "total_orders": "5"
  },
  {
    "customers": "738ffcf1017b584e9d2684b36e07469c",
    "total_orders": "4"
  },
  {
    "customers": "795c1622cf7a53d63d324e862349d01c",
    "total_orders": "4"
  },
  {
    "customers": "6358b15ef7fa9b1210f1a5735cabd3d9",
    "total_orders": "4"
  },
  {
    "customers": "7305430719d715992b00be82af4a6aa8",
    "total_orders": "4"
  },
  {
    "customers": "83e7958a94bd7f74a9414d8782f87628",
    "total_orders": "4"
  },
  {
    "customers": "4facc2e6fbc2bffab2fea92d2b4aa7e4",
    "total_orders": "4"
  }
]

*/