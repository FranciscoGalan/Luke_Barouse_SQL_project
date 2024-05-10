/*
Question 1: What are the top-paying data analyst jobs?
- Identify the top 10 highest-payng Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top-paying opportunities for Data Analysts
*/

SELECT
    jp.job_id,
    job_title,
    c.name
    job_location,
    job_schedule_type,
    ROUND(salary_year_avg),
    job_posted_date
FROM job_postings_fact jp
LEFT JOIN company_dim c
    ON c.company_id = jp.company_id
WHERE
        job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere' --To select remote roles
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20
;

/* Conclusions:
- I see many roles that are for Director, Manager, or "Principal" roles
*/