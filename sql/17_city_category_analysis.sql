WITH city_category_sales AS (
SELECT c.city,cat.category_name,SUM(oi.quantity) units_sold
FROM customers c JOIN orders o ON c.customer_id=o.customer_id JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id JOIN categories cat ON p.category_id=cat.category_id
WHERE o.status='Completed' GROUP BY c.city,cat.category_name),
ranked AS (SELECT *,RANK() OVER(PARTITION BY city ORDER BY units_sold DESC) category_rank FROM city_category_sales)
SELECT city,category_name,units_sold FROM ranked WHERE category_rank=1 ORDER BY city;
