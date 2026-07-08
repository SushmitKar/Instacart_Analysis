--recency - time since last purchase

-- select
-- user_id, days_since_prior_order as recency_proxy
-- from `ecommerce-analytics-499510.instacart_raw.orders`
-- qualify row_number() over(partition by user_id order by order_number desc) = 1;


-- alternate query
select user_id, days_since_prior_order as recency_proxy
from
(select
user_id, days_since_prior_order,
row_number() over(partition by user_id order by order_number desc) as rn
from `ecommerce-analytics-499510.instacart_raw.orders`)
where rn = 1;