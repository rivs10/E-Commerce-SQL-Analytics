WITH product_sales AS (
SELECT p.product_id,p.product_name,c.category_name,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id JOIN categories c ON p.category_id=c.category_id
WHERE o.status='Completed' GROUP BY p.product_id,p.product_name,c.category_name),
ranked AS (SELECT *,ROUND(revenue,2) revenue_rounded,DENSE_RANK() OVER(PARTITION BY category_name ORDER BY revenue DESC) category_rank FROM product_sales)
SELECT product_id,product_name,category_name,revenue_rounded revenue,category_rank FROM ranked WHERE category_rank<=5 ORDER BY category_name,category_rank;
