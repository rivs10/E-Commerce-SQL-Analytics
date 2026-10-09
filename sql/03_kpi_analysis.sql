WITH order_summary AS (
SELECT o.order_id,o.customer_id,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) order_revenue,
SUM(oi.quantity*(oi.unit_price*(1-oi.discount_pct)-p.cost_price)) order_profit,SUM(oi.quantity) units_sold
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed' GROUP BY o.order_id,o.customer_id)
SELECT COUNT(*) total_orders,COUNT(DISTINCT customer_id) active_customers,SUM(units_sold) units_sold,
ROUND(SUM(order_revenue),2) total_revenue,ROUND(AVG(order_revenue),2) average_order_value,
ROUND(SUM(order_profit),2) gross_profit,ROUND(100*SUM(order_profit)/NULLIF(SUM(order_revenue),0),2) profit_margin_pct
FROM order_summary;
