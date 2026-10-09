SELECT p.product_id,p.product_name,c.category_name,SUM(oi.quantity) units_sold,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)),2) revenue,
ROUND(SUM(oi.quantity*(oi.unit_price*(1-oi.discount_pct)-p.cost_price)),2) gross_profit
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id JOIN categories c ON p.category_id=c.category_id
WHERE o.status='Completed' GROUP BY p.product_id,p.product_name,c.category_name ORDER BY revenue DESC LIMIT 10;
