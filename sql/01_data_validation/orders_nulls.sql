select
countif(order_id is null) as order_id_nulls, 
countif(user_id is null) as user_id_nulls, 
countif(order_dow is null) as order_dow_nulls,
countif(order_hour_of_day is null) as order_hour_nulls,
countif(days_since_prior_order is null) as days_prior_orders_nulls
from `ecommerce-analytics-499510.instacart_raw.orders`;