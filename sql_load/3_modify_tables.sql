COPY public.categories
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Categories.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.customers
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.geolocation
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Geolocation.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.sellers
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Sellers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.products
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Products.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.orders
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Orders.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.order_items
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Order_Items.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.order_payments
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Order_Payments.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

COPY public.reviews
FROM 'C:\Users\colla\OneDrive\Desktop\SQL Projects\SQL_eCommerce_Analysis\csv_files\Reviews.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

