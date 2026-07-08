select 
user_id,
recency_proxy,
order_count,
total_items,
ntile(5) over(order by recency_proxy desc) as r_score, -- we want less days between consecutive orders
ntile(5) over(order by order_count asc) as f_score,
ntile(5) over(order by total_items asc) as m_score,
from `ecommerce-analytics-499510.instacart_analytics.rfm_base_result`
order by user_id;