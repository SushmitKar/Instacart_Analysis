-- avg basket (cart) size
select 
round(avg(items_per_order), 2) as avg_basket_size,
min(items_per_order) as min_basket,
max(items_per_order) as max_basket,
approx_quantiles(items_per_order, 4)[offset(2)] as median_basket
from (
  select order_id, count(*) as items_per_order
  from `ecommerce-analytics-499510.instacart_raw.order_products`
  group by order_id
);