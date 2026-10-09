WITH order_values AS (
SELECT o.order_id,o.customer_id,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) order_value
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id WHERE o.status='Completed' GROUP BY o.order_id,o.customer_id)
SELECT c.customer_segment,COUNT(*) completed_orders,ROUND(AVG(ov.order_value),2) average_order_value,ROUND(SUM(ov.order_value),2) total_revenue
FROM order_values ov JOIN customers c ON ov.customer_id=c.customer_id GROUP BY c.customer_segment ORDER BY average_order_value DESC;
