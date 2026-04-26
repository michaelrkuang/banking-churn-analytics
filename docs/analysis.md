# Bank Customer Churn Analysis
**Dataset:** Kaggle Bank Customer Churn (10,000 customers)
**Tools:** AWS S3, Glue, Athena, QuickSight
**Dashboard:** Published via Amazon QuickSight

## Objective
Identify key drivers of customer churn at a European bank and surface actionable retention insights.

## Overall churn rate %

Query: 
SELECT
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * SUM(exited) / COUNT(*), 2) AS churn_rate_pct
FROM michael_bank_churn_data;

Findings:
- Total customers: 10000
- Churned customers: 2037
- Overall churn rate: 20.37%


## High Balance (100k+) vs. Churn Rate
SELECT
    CASE when balance >= 100000 THEN 'High Balance (100k+)'
    ELSE 'Standard Balance (<100k)'
    END AS segment,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY 1;

Findings:
- (<100k): 826 churned customers, 15.88% churn rate
- (100k+): 1211 churned customers, 25.23% churn rate
- High-balance customer churn rate is 59% higher than lower balance customers
- The bank's most valuable customers are most at-risk


## Churn by Country
SELECT 
    geography,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY geography
ORDER BY churn_rate_pct DESC;

Findings:
- Germany: 2509 customers, 814 churned, 32.44% churn rate
- Spain: 2477 customers, 413 churned, 16.67% churn rate
- France: 5014 customers, 810 churned, 16.15% churn rate
- Germany's churn rate is roughly double of Spain and France
- Despite France having the largest largest customer base, its churn rate is the lowest
- Germany is a clear problem market and the strongest candidate for a targeted retention strategy

## Churn by Age Group
SELECT 
    CASE
        WHEN age < 30 THEN '18-29'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        WHEN age < 60 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY 1
ORDER BY age_group;

Findings:
- 18-29: 1641 customers, 124 churned, 7.56% churn rate
- 30-39: 4346 customers, 473 churned, 10.88% churn rate
- 40-49: 2618 customers, 806 churned, 30.79% churn rate
- 50-59: 869 customers, 487 churned, 56.04% churn rate
- 60+: 526 customers, 147 churned, 27.95% churn rate
- Customers aged 40+ are significantly more at risk than younger customers
- The 18-39 age groups are the most loyal, both under 11% churn

## Product Stickiness

SELECT
    numofproducts,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY numofproducts
ORDER BY numofproducts;

Findings:
- 1 product: 27.71% churn - moderately high, these customers have little tying them to the bank
- 2 products: 7.58% churn - the sweeet spot, these customers are the most loyal
- 3 products: 82.71% churn - incredibly high, retention is low here
- 4: 100% churn - every single customer with 4 products left
- 2 products is the retention sweet spot. The strategy should be to move 1-product customers to 2 products, but avoid pushing 3 or 4.

## Churn Rate by Member Activity Status

SELECT 
    CASE WHEN isactivemember = 1 THEN 'Active'
    ELSE 'Inactive'
    END AS member_status,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY isactivemember;

Findings: 
- Active: 5151 customers, 735 churned, 14.27% churn rate
- Inactive: 4849 customers, 1302 churned, 26.85% churn rate
- Inactive members churn at nearly twice the rate of active members
- Despite having fewer customers, inactive members account for the majority of total churn (1302 vs 735)
- Disengagement is a strong predictor of churn. The bank should prioritize re-engagement compains targeting inactive customers before they leave.

## Churn Rate by Credit Score Band

SELECT 
    CASE
        WHEN creditscore < 500 THEN 'Poor. (300-499)'
        WHEN creditscore < 600 THEN 'Fair (500-599)'
        WHEN creditscore < 700 THEN 'Good (600-699)'
        WHEN creditscore < 800 THEN 'Very Good (700-799)'
        ELSE 'Excellent (800+)'
    END AS credit_band,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY 1
ORDER BY credit_band;

Findings:
- Churn rates were consistent across all credit score bands, ranging from 19.54% to 23.73%
- No significant correlation found between credit score and churn
- Credit score is not a reliable predictor of customer attrition

## Churn Ratye by Gender

SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY gender
ORDER BY churn_rate_pct DESC;

Findings:
- Female: 4543 customers, 1139 churned, 25.07% churn rate
- Male: 5457 customers, 898 churned, 16.46% churn rate
- Female customers churn at a 52% higher rate than male customers

## Key Findings Summary

1. Germany is the highest-risk market at 32.44% — double France and Spain
2. 2-product customers are the most loyal (7.58%); 3-4 products churn at extreme rates (82-100%)
3. Customers aged 50-59 churn at 56% — the single highest-risk segment
4. Inactive members account for the majority of total churn despite being the smaller group
5. High-balance customers (100k+) churn at 59% higher rates — most valuable customers are most at risk
6. Female customers churn at 52% higher rate than male customers
7. Credit score has no meaningful correlation with churn