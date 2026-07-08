select
  countif(department_id is null) as null_aisle_id,
  countif(department is null) as null_aisle_name
from `ecommerce-analytics-499510.instacart_raw.departments`;