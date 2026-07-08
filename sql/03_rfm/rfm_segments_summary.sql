-- -- rfm summary
CREATE OR REPLACE TABLE `ecommerce-analytics-499510.instacart_analytics.rfm_segment_summary` AS

WITH base AS (
  SELECT
    s.user_id,
    s.segment,
    b.recency_proxy,
    b.order_count,
    b.total_items
  FROM `ecommerce-analytics-499510.instacart_analytics.rfm_segments` s
  JOIN `ecommerce-analytics-499510.instacart_analytics.rfm_base_result` b
    USING (user_id)
)

SELECT
  segment,
  COUNT(*) AS user_count,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_users,
  ROUND(AVG(recency_proxy), 2) AS avg_recency_days,
  ROUND(AVG(order_count), 2) AS avg_order_count,
  ROUND(AVG(total_items), 2) AS avg_total_items,
  SUM(order_count) AS total_orders,
  SUM(total_items) AS total_overall_items
FROM base
GROUP BY segment
ORDER BY user_count DESC;