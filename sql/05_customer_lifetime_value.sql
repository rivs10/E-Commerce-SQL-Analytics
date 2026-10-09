SELECT c.customer_id,c.customer_name,c.customer_segment,c.city,COUNT(DISTINCT o.order_id) completed_orders,
SUM(oi.quantity) units_purchased,ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)),2) customer_revenue
FROM customers c JOIN orders o ON c.customer_id=o.customer_id JOIN order_items oi ON o.order_id=oi.order_id
WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name,c.customer_segment,c.city
ORDER BY customer_revenue DESC LIMIT 20;
