-- 1. Число строк в 9 таблицах (сверить с ориентирами практикума)
SELECT 'customers' AS table_name, count(*) FROM olist.customers
UNION ALL SELECT 'orders', count(*) FROM olist.orders
UNION ALL SELECT 'order_items', count(*) FROM olist.order_items
UNION ALL SELECT 'order_payments', count(*) FROM olist.order_payments
UNION ALL SELECT 'order_reviews', count(*) FROM olist.order_reviews
UNION ALL SELECT 'products', count(*) FROM olist.products
UNION ALL SELECT 'sellers', count(*) FROM olist.sellers
UNION ALL SELECT 'geolocation', count(*) FROM olist.geolocation
UNION ALL SELECT 'category_translation', count(*) FROM olist.product_category_name_translation;

-- 2. Осиротевшие позиции заказов (должно быть 0)
SELECT count(*) AS orphan_items
FROM olist.order_items oi
LEFT JOIN olist.orders o ON o.order_id = oi.order_id
WHERE o.order_id IS NULL;

-- 3. NULL в ключевых полях (должно быть 0)
SELECT count(*) AS null_customer_id FROM olist.customers WHERE customer_id IS NULL;
SELECT count(*) AS null_order_id FROM olist.orders WHERE order_id IS NULL;
SELECT count(*) AS null_product_id FROM olist.products WHERE product_id IS NULL;

-- 4. Обновление статистики планировщика
ANALYZE VERBOSE olist.customers;
ANALYZE VERBOSE olist.orders;
ANALYZE VERBOSE olist.order_items;
ANALYZE VERBOSE olist.order_payments;
ANALYZE VERBOSE olist.order_reviews;
ANALYZE VERBOSE olist.products;
ANALYZE VERBOSE olist.sellers;
ANALYZE VERBOSE olist.geolocation;
ANALYZE VERBOSE olist.product_category_name_translation;