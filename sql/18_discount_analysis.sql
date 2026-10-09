SELECT CASE WHEN oi.discount_pct=0 THEN 'No Discount' WHEN oi.discount_pct<0.10 THEN '1-9%' WHEN oi.discount_pct<0.20 THEN '10-19%' ELSE '20%+' END discount_band,
COUNT(*) line_items,SUM(oi.quantity) units_sold,ROUND(SUM(oi.quantity*oi.unit_price*(1-oi.discount_pct)),2) revenue
FROM order_items oi JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
GROUP BY CASE WHEN oi.discount_pct=0 THEN 'No Discount' WHEN oi.discount_pct<0.10 THEN '1-9%' WHEN oi.discount_pct<0.20 THEN '10-19%' ELSE '20%+' END
ORDER BY revenue DESC;
