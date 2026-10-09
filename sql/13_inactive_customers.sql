SELECT c.customer_id,c.customer_name,c.city,MAX(CASE WHEN o.status='Completed' THEN o.order_date END) last_completed_order
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id GROUP BY c.customer_id,c.customer_name,c.city
HAVING MAX(CASE WHEN o.status='Completed' THEN o.order_date END) IS NULL
OR MAX(CASE WHEN o.status='Completed' THEN o.order_date END)<DATE '2025-12-31'-INTERVAL '180 days'
ORDER BY last_completed_order;
