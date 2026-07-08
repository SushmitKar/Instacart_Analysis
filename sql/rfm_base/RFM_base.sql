with recency as (
  select user_id, days_since_prior_order as recency_proxy
  from `ecommerce-analytics-499510.instacart_raw.orders`
  qualify row_number() over(partition by user_id order by order_number desc) = 1
),
frequency as (
  select user_id, count(order_id) as order_count
  from `ecommerce-analytics-499510.instacart_raw.orders`
  group by user_id
),
monetary as (
  select o.user_id, count(*) as total_items
  from `ecommerce-analytics-499510.instacart_raw.orders` o
  join `ecommerce-analytics-499510.instacart_raw.order_products` op
  on o.order_id = op.order_id
  group by o.user_id
)

select
r.user_id,
r.recency_proxy,
f.order_count,
m.total_items
from recency r
join frequency f on r.user_id = f.user_id
join monetary m on r.user_id = m.user_id;