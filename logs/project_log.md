# Project Log

## Phase 1 – S3 Data Landing
- Created S3 bucket: aws-banking-churn-analytics
- Created folder: raw_data/
- Uploaded: Churn_Modelling.csv

## Phase 2 – AWS Glue
- Created Glue crawler: churn-data-crawler
- Data source: s3://aws-banking-churn-analytics/raw_data/
- Created database: banking_analytics
- Table created: raw_data

## Phase 3 – Athena Setup
- Configured query results location: s3://aws-banking-churn-analytics/athena-results/
- Verified table using SELECT * LIMIT 10