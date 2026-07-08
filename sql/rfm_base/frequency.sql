-- frequency
select user_id, count(order_id) as order_count from `ecommerce-analytics-499510.instacart_raw.orders` group by user_id order by order_count desc;