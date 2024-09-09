# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.
🔍 SQL queries? Check them out here: [sql_project folder](/sql_project/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

### Key Insights Derived From SQL Queries
- What are the top-paying data analyst jobs?
-  What skills are required for these top-paying jobs?
-  What skills are most in demand for data analysts?
-  Which skills are associated with higher salaries?
-  What are the most optimal skills to learn?

# Tools Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL :** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL :** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
  
# Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

``` SQL
-- Top 10 Highest Paying Data Analyst Positions Along With Company Name.
SELECT
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    name
FROM
    job_postings_fact LEFT JOIN company_dim ON
    company_dim.company_id = job_postings_fact.company_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
# Inference
# Conclusion
