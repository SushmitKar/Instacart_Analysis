--user count dist
select
case
when order_count = 1 then "1 order"
when order_count between 2 and 5 then "2-5 orders"
when order_count between 6 and 10 then "6-10 orders"
when order_count between 11 and 20 then "11-20 orders"
else "20+ orders"
end as frequency_bucket, count(*) as user_count
from (
  select user_id, count(*) as order_count from `ecommerce-analytics-499510.instacart_raw.orders` group by user_id
)
group by frequency_bucket
order by min(
  case 
  when frequency_bucket = "1 order" then 1
  when frequency_bucket = "2-5 orders" then 2
  when frequency_bucket = "6-10 orders" then 3
  when frequency_bucket = "11-20 orders" then 4
  else 5
  end
)