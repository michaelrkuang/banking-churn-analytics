z# Project Log

## Phase 1 – S3 Data Landing
- Created S3 bucket: michael-bank-churn-data
- Created folder: raw_data/
- Uploaded: Churn_Modelling.csv to s3://michael-bank-churn-data/raw_data/Churn_Modelling.csv

## Phase 2 – AWS Glue
- Created Glue crawler: churn-data-crawler
- Data source: s3://michael-bank-churn-data/raw_data/
- Created database: banking_analytics
- Table created: michael_bank_churn_data

## Phase 3 – Athena Setup
- Ran SQL queries to analyze churn across key dimensions
- Queries completed: overall churn rate, balance segmentation, geography, age group, product stickiness, member activity status, credit score band

## Phase 4 - QuickSight Dashboard
- Connected Athena dataset: bank-churn-analysis
- Created Quicksight dashboard
- 6 dashboards built (Geography, Product Count, Age Band, Activity Status, Gender, KPI card)
- Dashboard published
- Key finding: 50-59 age group at 56% churn, Germany at 32.44%, inactive members account for majority of total churn

