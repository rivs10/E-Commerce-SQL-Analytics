WITH category_sales AS (
SELECT c.category_name,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id JOIN categories c ON p.category_id=c.category_id
WHERE o.status='Completed' GROUP BY c.category_name)
SELECT category_name,ROUND(revenue,2) revenue,ROUND(100*revenue/SUM(revenue) OVER(),2) revenue_share_pct
FROM category_sales ORDER BY revenue DESC;
