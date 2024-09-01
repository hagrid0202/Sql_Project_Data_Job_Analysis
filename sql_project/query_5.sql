-- Most optimal skills
WITH skills_demand AS (
SELECT
    skills_dim.skill_id,
    COUNT (skills_job_dim.job_id) AS positions,
    skills_dim.skills
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'AND
    job_postings_fact.job_work_from_home = true AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
), average_salary AS (
    SELECT
    skills_dim.skill_id,
    ROUND( AVG(job_postings_fact.salary_year_avg), 3) as avg_salary,
    skills_dim.skills
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'AND
    job_postings_fact.job_work_from_home = true AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.positions,
    average_salary.avg_salary
FROM
    skills_demand
    INNER JOIN average_salary ON average_salary.skill_id = skills_demand.skill_id;