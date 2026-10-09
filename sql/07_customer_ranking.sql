WITH customer_sales AS (
SELECT c.customer_id,c.customer_name,c.customer_segment,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) customer_revenue
FROM customers c JOIN orders o ON c.customer_id=o.customer_id JOIN order_items oi ON o.order_id=oi.order_id
WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name,c.customer_segment),
ranked AS (SELECT *,ROUND(customer_revenue,2) revenue,RANK() OVER(PARTITION BY customer_segment ORDER BY customer_revenue DESC) segment_rank FROM customer_sales)
SELECT customer_id,customer_name,customer_segment,revenue,segment_rank FROM ranked WHERE segment_rank<=5 ORDER BY customer_segment,segment_rank;
