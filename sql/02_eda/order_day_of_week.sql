-- order time
select
case order_dow
when 0 then "Sunday"
when 1 then "Monday"
when 2 then "Tuesday"
when 3 then "Wednesday"
when 4 then "Thursday"
when 5 then "Friday"
when 6 then "Saturday"
end as day_of_week, count(*) as order_count
from `ecommerce-analytics-499510.instacart_raw.orders`
group by order_dow
order by order_dow;