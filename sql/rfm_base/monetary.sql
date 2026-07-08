-- monetary
select o.user_id, count(*) as total_items
from `ecommerce-analytics-499510.instacart_raw.orders` o
join `ecommerce-analytics-499510.instacart_raw.order_products` op
on o.order_id = op.order_id
group by o.user_id
order by total_items
desc;