SELECT c.category_name,SUM(oi.quantity) units_sold,
ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)),2) revenue,
ROUND(SUM(oi.quantity*(oi.unit_price*(1-oi.discount_pct)-p.cost_price)),2) gross_profit,
ROUND(100*SUM(oi.quantity*(oi.unit_price*(1-oi.discount_pct)-p.cost_price))/NULLIF(SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)),0),2) profit_margin_pct
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id JOIN categories c ON p.category_id=c.category_id
WHERE o.status='Completed' GROUP BY c.category_name ORDER BY revenue DESC;
