-- dept sales
select d.department, count(*) as purchase_count,
round(count(*) * 100.0 / sum(count(*)) over(), 2) as pct_of_total,
from `ecommerce-analytics-499510.instacart_raw.order_products` op
join `ecommerce-analytics-499510.instacart_raw.products` p
on op.product_id = p.product_id
join `ecommerce-analytics-499510.instacart_raw.departments` d
on p.department_id = d.department_id
group by d.department
order by purchase_count desc;