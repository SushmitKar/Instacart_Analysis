--top 10 aisles
select 
a.aisle, count(*) as purchase_count
from `ecommerce-analytics-499510.instacart_raw.order_products` op
join `ecommerce-analytics-499510.instacart_raw.products` p
on op.product_id = p.product_id
join `ecommerce-analytics-499510.instacart_raw.aisles` a
on p.aisle_id = a.aisle_id
group by a.aisle
order by purchase_count desc
limit 10;