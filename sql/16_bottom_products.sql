SELECT p.product_id,p.product_name,c.category_name,
COALESCE(SUM(CASE WHEN o.status='Completed' THEN oi.quantity ELSE 0 END),0) units_sold,
ROUND(COALESCE(SUM(CASE WHEN o.status='Completed' THEN oi.quantity*oi.unit_price*(1-oi.discount_pct) ELSE 0 END),0),2) revenue
FROM products p JOIN categories c ON p.category_id=c.category_id
LEFT JOIN order_items oi ON p.product_id=oi.product_id LEFT JOIN orders o ON oi.order_id=o.order_id
GROUP BY p.product_id,p.product_name,c.category_name ORDER BY units_sold,revenue LIMIT 10;
