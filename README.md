# Bank Customer Churn Analysis

## Business Context

Customer churn is one of the most expensive problems a retail bank can face. Acquiring a new customer costs significantly more than retaining an existing one, yet most banks lack the analytical infrastructure to identify at-risk customers before they leave.

This project simulates the work of a data analyst embedded in a European bank's retention team. The bank operates across three markets — France, Spain, and Germany — and is experiencing an overall churn rate of **20.37%**, meaning roughly 1 in 5 customers is leaving. Without understanding *who* is churning and *why*, retention efforts are unfocused and expensive.

The goal of this analysis is to surface the key drivers of churn across customer demographics, geography, product usage, and engagement — and translate those findings into actionable retention strategies.

---

## Dashboard

![Bank Customer Churn Analysis Dashboard](quicksight/dashboard.png)

---

## Tools & Architecture

**S3 → Glue → Athena → QuickSight**

- **AWS S3** – Raw data storage
- **AWS Glue** – Crawler for automated schema detection and cataloging
- **AWS Athena** – SQL analysis on top of the Glue data catalog
- **AWS QuickSight** – Interactive dashboard and visualization

---

## Dataset

Kaggle Bank Customer Churn dataset — 10,000 customers across France, Spain, and Germany with attributes including age, balance, product count, activity status, credit score, and gender.

---

## Key Findings

1. **Overall churn rate: 20.37%** — 2,037 of 10,000 customers left the bank
2. **Germany is the highest-risk market** at 32.44% — double France and Spain (~16%)
3. **2-product customers are the most loyal** (7.58% churn); 3-4 product customers churn at extreme rates (82–100%)
4. **Customers aged 50-59 churn at 56%** — the single highest-risk demographic segment
5. **Inactive members account for the majority of total churn** (1,302 vs 735) despite being the smaller group
6. **High-balance customers (100k+) churn at 59% higher rates** — the most valuable customers are most at risk
7. **Female customers churn at 52% higher rate** than male customers (25.07% vs 16.46%)
8. **Credit score has no meaningful correlation with churn** — consistent rates across all bands (19–23%)

---

## Business Recommendations

**1. Launch a Germany-specific retention program**
Germany's 32.44% churn rate is an outlier that warrants dedicated investigation. Whether driven by competitive pressure, service gaps, or product-market fit issues, a targeted retention strategy for German customers should be the highest priority intervention.

**2. Cross-sell 1-product customers to 2 products**
The data is unambiguous — 2-product customers churn at just 7.58% vs 27.71% for single-product customers. A structured cross-sell program moving customers from 1 to 2 products is the highest-ROI retention lever available. Critically, the bank should avoid pushing customers beyond 2 products, as 3-4 product customers show catastrophic churn rates (82–100%).

**3. Re-engage inactive members before they leave**
Inactive members churn at nearly twice the rate of active members (26.85% vs 14.27%) and account for the majority of total churn. Early re-engagement campaigns — targeted emails, personalized offers, or proactive outreach — could intercept at-risk customers before disengagement becomes departure.

**4. Build a dedicated retention track for the 50-59 age segment**
At 56% churn, this group is the single highest-risk demographic. Loyalty programs, dedicated relationship managers, or age-appropriate product bundles could meaningfully reduce attrition in this segment.

**5. Introduce premium retention measures for high-balance customers**
High-balance customers (100k+) churn at 25.23% vs 15.88% for standard customers — yet they represent the bank's most valuable relationships. Proactive outreach, premium service tiers, or wealth management offerings should be prioritized for this segment.

**6. Investigate the gender churn gap**
Female customers churn at 25.07% vs 16.46% for male customers — a 52% difference that warrants further investigation. Understanding whether this reflects product gaps, service experience, or competitive factors could unlock a significant retention opportunity.

**7. Deprioritize credit score as a churn predictor**
With churn rates ranging from 19.54% to 23.73% across all credit bands, credit score adds no predictive value for churn modeling. Retention models should focus on age, geography, product count, and activity status instead.

---

## Repository Structure

```
├── athena/
│   └── queries.sql          # All SQL queries run in Athena
├── data/
│   └── Churn_Modelling.csv  # Source dataset
├── docs/
│   ├── analysis.md          # Full query results and findings
│   └── data_validation.md
├── logs/
│   └── project_log.md
├── quicksight/
│   ├── dashboard.png        # Dashboard screenshot
│   └── dashboard.pdf        # Dashboard export
```
