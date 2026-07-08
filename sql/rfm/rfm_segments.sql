-- rfm segments
create or replace table `ecommerce-analytics-499510.instacart_analytics.rfm_segments` as

with fm as (
select 
user_id,
r_score,
f_score,
m_score,
round((f_score + m_score) / 2) as fm_score
from `ecommerce-analytics-499510.instacart_analytics.rfm_scores`
)

select
user_id,
r_score,
f_score,
m_score,
fm_score,
case
when r_score >= 4 and fm_score >= 4 then 'top priority'
when r_score >= 4 and fm_score = 3 then 'loyal customers'
when r_score >= 4 and fm_score <= 2 then 'promising'
when r_score = 3 and fm_score >= 4 then 'solid customers'
when r_score = 3 and fm_score = 3 then 'needs attention'
when r_score = 3 and fm_score <= 2 then 'about to sleep'
when r_score <= 2 and fm_score >= 4 then 'cant lose them'
when r_score <= 2 and fm_score = 3 then 'at risk'
when r_score <= 2 and fm_score <= 2 then 'lost'
end as segment
from fm;