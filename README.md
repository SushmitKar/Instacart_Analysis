# Instacart Customer RFM Segmentation

## Overview
RFM (Recency, Frequency, Monetary) segmentation of 206,000+ Instacart customers using BigQuery SQL. Customers are grouped into 9 actionable segments to identify high-value users, churn risks, and win-back opportunities.

## Dataset
- Source: [Instacart Market Basket Analysis (Kaggle)](https://www.kaggle.com/c/instacart-market-basket-analysis)
- 3.4M orders, 206K+ users, 32M+ order-product rows
- Loaded into BigQuery (`ecommerce-analytics-499510.instacart_raw`)

## Methodology
1. Data validation — row counts, null checks, duplicate checks
2. EDA — order timing, basket size, top products/departments
3. RFM scoring via NTILE(3) quintiles per dimension
4. F+M scores combined into a single FM score (averaged + rounded)
5. 3×3 R × FM grid produces 9 exhaustive, non-overlapping segments

## Known Limitations
- **No price data** — Monetary is proxied by total items purchased, not actual spend
- **No calendar dates** — Recency uses `days_since_prior_order` from each user's most recent order (capped at 30 by the dataset)
- **Pre-filtered dataset** — all users have minimum 4 orders; single-order/new user churn analysis is not possible

## Segments
| Segment | R | FM | Interpretation |
|---|---|---|---|
| Top Priority | High | High | Recent, frequent, high volume |
| Loyal Customers | High | Mid | Recent, moderate volume |
| Promising | High | Low | Recent but infrequent |
| Solid Customers | Mid | High | High volume, recency slipping |
| Needs Attention | Mid | Mid | Average on all dimensions |
| About To Sleep | Mid | Low | Recency and volume both declining |
| Can't Lose Them | Low | High | High past value, now inactive — highest win-back ROI |
| At Risk | Low | Mid | Lapsed, moderate past value |
| Lost | Low | Low | Lapsed, low past value |

## Stack
- **BigQuery** — all transformation and segmentation logic
- **Tableau Public** — dashboard

## Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/sushmit.kar/viz/RFMAnalysis_17830174524470/Dashboard1)

## SQL Pipeline
| File | Description |
|---|---|
| `01_data_validation.sql` | Row counts, nulls, duplicates |
| `02_eda.sql` | Order timing, basket size, top products |
| `03_rfm_base.sql` | Raw R, F, M values per user |
| `04_rfm_scores.sql` | NTILE scoring + FM combined score |
| `05_rfm_segments.sql` | User-level segment assignment |
| `06_rfm_segment_summary.sql` | 9-row aggregate for dashboard |