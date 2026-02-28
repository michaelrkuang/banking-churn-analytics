##  Row Count
Query: 
SELECT COUNT(*) AS total_rows

Findings:
10000 rows

## Data Type
Query: 

DESCRIBE michael_bank_churn_data;

Findings:

rownumber           	bigint              	                    
customerid          	bigint              	                    
surname             	string              	                    
creditscore         	bigint              	                    
geography           	string              	                    
gender              	string              	                    
age                 	bigint              	                    
tenure              	bigint              	                    
balance             	double              	                    
numofproducts       	bigint              	                    
hascrcard           	bigint              	                    
isactivemember      	bigint              	                    
estimatedsalary     	double              	                    
exited              	bigint              	                    
partition_0         	string

## Null Check

Query: 

SELECT
    SUM(CASE WHEN creditscore IS NULL THEN 1 ELSE 0 END) AS null_creditscore,
    SUM(CASE WHEN geography IS NULL THEN 1 ELSE 0 END) AS null_geography,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS null_balance,
    SUM(CASE WHEN exited IS NULL THEN 1 ELSE 0 END) AS null_exited
FROM michael_bank_churn_data;

Findings:
0 NULL values in any of the data.

## Duplicate Customer ID

Query:

SELECT customerid, COUNT(*) AS COUNT
FROM michael_bank_churn_data
GROUP BY customerid
HAVING COUNT(*) > 1;

Findings:
No duplicates.

## Range Validation

Queries:

### Age

SELECT MIN (age) AS min_age,
        MAX (age) AS max_age
FROM michael_bank_churn_data;

### Credit Score

SELECT MIN(creditscore), MAX(creditscore)
FROM michael_bank_churn_data;

### Balance

SELECT MIN(balance), MAX(balance)
FROM michael_bank_churn_data;


Findings:
Age: The minimum customer age was 18 and the maximum was 92 years old.
Credit Score: The lowest was 350 while the greatest was 850.
Balance: The lowest was 0 while the greatest was $250898.09.






