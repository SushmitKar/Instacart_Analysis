-- Reorder rate
select p.product_name,
count(*) as total_purchase,
sum(op.reordered) as reorder_count,
round(sum(op.reordered)*100.0 / count(*), 2) as reorder_rate_pct
from `ecommerce-analytics-499510.instacart_raw.order_products` op
join `ecommerce-analytics-499510.instacart_raw.products` p
on p.product_id = op.product_id
group by p.product_name
having count(*) > 500
order by reorder_rate_pct DESC
limit 20;