-- Bank Customer Churn Analysis
-- Database: banking_analytics
-- Table: michael_bank_churn_data

-- ============================================
-- 1. Overall Churn Rate
-- ============================================
SELECT
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(100.0 * SUM(exited) / COUNT(*), 2) AS churn_rate_pct
FROM michael_bank_churn_data;

-- ============================================
-- 2. Churn by Balance Segment
-- ============================================
SELECT
    CASE WHEN balance >= 100000 THEN 'High Balance (100k+)'
    ELSE 'Standard Balance (<100k)'
    END AS segment,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY 1;

-- ============================================
-- 3. Churn by Geography
-- ============================================
SELECT 
    geography,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY geography
ORDER BY churn_rate_pct DESC;

-- ============================================
-- 4. Churn by Age Group
-- ============================================
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

-- ============================================
-- 5. Churn by Product Count (Product Stickiness)
-- ============================================
SELECT
    numofproducts,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY numofproducts
ORDER BY numofproducts;

-- ============================================
-- 6. Churn by Member Activity Status
-- ============================================
SELECT 
    CASE WHEN isactivemember = 1 THEN 'Active'
    ELSE 'Inactive'
    END AS member_status,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY isactivemember;

-- ============================================
-- 7. Churn by Credit Score Band
-- ============================================
SELECT 
    CASE
        WHEN creditscore < 500 THEN 'Poor (300-499)'
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

-- ============================================
-- 8. Churn by Gender
-- ============================================
SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND(CAST(SUM(exited) AS DOUBLE) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM michael_bank_churn_data
GROUP BY gender
ORDER BY churn_rate_pct DESC;
