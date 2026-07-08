select p.product_name, count(*) as purchase_count
from `ecommerce-analytics-499510.instacart_raw.products` p
join `ecommerce-analytics-499510.instacart_raw.order_products` op
on p.product_id = op.product_id 
group by p.product_name
order by purchase_count
DESC LIMIT 20;