-- Top 10 highest paying data analyst positions along with company name
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
