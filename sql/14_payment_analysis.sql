SELECT payment_method,COUNT(*) total_payments,
SUM(CASE WHEN payment_status='Paid' THEN 1 ELSE 0 END) successful_payments,
SUM(CASE WHEN payment_status='Refunded' THEN 1 ELSE 0 END) refunded_payments,
ROUND(100*SUM(CASE WHEN payment_status='Paid' THEN 1 ELSE 0 END)/COUNT(*),2) success_rate_pct,
ROUND(100*SUM(CASE WHEN payment_status='Refunded' THEN 1 ELSE 0 END)/COUNT(*),2) refund_rate_pct
FROM payments GROUP BY payment_method ORDER BY success_rate_pct DESC;
