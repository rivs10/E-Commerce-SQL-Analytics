WITH customer_orders AS (
SELECT customer_id,COUNT(DISTINCT order_id) completed_orders FROM orders WHERE status='Completed' GROUP BY customer_id)
SELECT CASE WHEN completed_orders=1 THEN 'One-Time Customer' ELSE 'Repeat Customer' END customer_type,
COUNT(*) customer_count,ROUND(100.0*COUNT(*)/SUM(COUNT(*)) OVER(),2) percentage_of_customers
FROM customer_orders GROUP BY CASE WHEN completed_orders=1 THEN 'One-Time Customer' ELSE 'Repeat Customer' END
ORDER BY customer_count DESC;
