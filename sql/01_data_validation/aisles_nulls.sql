select
  countif(aisle_id is null) as null_aisle_id,
  countif(aisle is null) as null_aisle_name
from `ecommerce-analytics-499510.instacart_raw.aisles`;