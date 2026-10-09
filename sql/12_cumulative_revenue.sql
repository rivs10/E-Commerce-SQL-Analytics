WITH monthly_sales AS (
SELECT DATE_TRUNC('month',o.order_date) month,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id WHERE o.status='Completed' GROUP BY DATE_TRUNC('month',o.order_date))
SELECT month,ROUND(revenue,2) monthly_revenue,ROUND(SUM(revenue) OVER(ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW),2) cumulative_revenue
FROM monthly_sales ORDER BY month;
