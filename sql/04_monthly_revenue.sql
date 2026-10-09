WITH monthly_sales AS (
SELECT DATE_TRUNC('month',o.order_date) month,SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id WHERE o.status='Completed'
GROUP BY DATE_TRUNC('month',o.order_date)),
monthly_growth AS (SELECT month,revenue,LAG(revenue) OVER(ORDER BY month) previous_month_revenue FROM monthly_sales)
SELECT month,ROUND(revenue,2) revenue,ROUND(previous_month_revenue,2) previous_month_revenue,
ROUND(100*(revenue-previous_month_revenue)/NULLIF(previous_month_revenue,0),2) month_over_month_growth_pct
FROM monthly_growth ORDER BY month;
