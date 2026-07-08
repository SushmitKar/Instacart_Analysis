select
countif(order_id is null) as order_id_nulls,
countif(product_id is null) as product_id_nulls,
countif(add_to_cart_order is null) as card_order_nulls,
countif(reordered is null) as reordered_nulls
from `ecommerce-analytics-499510.instacart_raw.order_products`;
