-- In demand skills for a data analyst
SELECT
    COUNT (skills_job_dim.job_id) AS positions,
    skills_dim.skills
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.job_location = 'Bengaluru, Karnataka, India'
GROUP BY
    skills_dim.skills
ORDER BY
    positions DESC
LIMIT 10;
