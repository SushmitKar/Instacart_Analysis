select
countif(product_id is null) as product_id_nulls,
countif(product_name is null) as product_name_nulls,
countif(aisle_id is null) as aisles_id_nulls,
countif(department_id is null) as department_id_nulls
from `ecommerce-analytics-499510.instacart_raw.products`;