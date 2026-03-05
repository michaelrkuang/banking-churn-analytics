## Overall churn rate %

Query: 
select
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * SUM(exited) / COUNT(*), 2) AS churn_rate_pct
FROM michael_bank_churn_data;

Findings:
- Total customers: 10000
- CHurned customers: 2037
- Overall churn rate: 20.37%

