SELECT 'Orders without customers' check_name,COUNT(*) issue_count FROM orders o LEFT JOIN customers c ON o.customer_id=c.customer_id WHERE c.customer_id IS NULL
UNION ALL SELECT 'Order items without orders',COUNT(*) FROM order_items oi LEFT JOIN orders o ON oi.order_id=o.order_id WHERE o.order_id IS NULL
UNION ALL SELECT 'Order items without products',COUNT(*) FROM order_items oi LEFT JOIN products p ON oi.product_id=p.product_id WHERE p.product_id IS NULL
UNION ALL SELECT 'Products without categories',COUNT(*) FROM products p LEFT JOIN categories c ON p.category_id=c.category_id WHERE c.category_id IS NULL;
