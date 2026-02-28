# Project Log

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
- Configured query results location: s3://michael-bank-churn-data/athena-results/
- Verified table query:
  - SELECT * FROM michael_bank_churn_data LIMIT 10;