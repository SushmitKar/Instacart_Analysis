-- hour of day
select
order_hour_of_day, count(*) as order_count
from `ecommerce-analytics-499510.instacart_raw.orders`
group by order_hour_of_day
order by order_hour_of_day;