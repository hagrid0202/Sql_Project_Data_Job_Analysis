-- Highest paying skillset
WITH jobs_anywhere AS (
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
LIMIT 10
)

SELECT 
    jobs_anywhere.*,
    skills_dim.skills
FROM 
    jobs_anywhere
INNER JOIN skills_job_dim ON skills_job_dim.job_id = jobs_anywhere.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
;