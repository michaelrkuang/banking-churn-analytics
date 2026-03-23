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

FIndings:
- 18-29: 1641 customers, 124 churned, 7.56% churn rate
- 30-39: 4346 customers, 473 churned, 10.88% churn rate
- 40-49: 2618 customers, 806 churned, 30.79% churn rate
- 50-59: 869 customers, 487 churned, 56.04% churn rate
- 60+: 526 customers, 147 churned, 27.95% churn rate
- Customers aged 40+ are significantly more at risk than younger customers
- The 18-39 age groups are the most loyal, both under 11% churn