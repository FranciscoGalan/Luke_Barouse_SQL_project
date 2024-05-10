/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why? Retrieves the top 5 skills with the highest demand in the job market. 
*/

SELECT
    sd.skills,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10
;

-- Let's see demand for remote jobs only
-- Answer: the top skills are exactly the same
SELECT
    sd.skills,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE 
        job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10
;


-- Let's see demand for job in the US
-- Answer: same as the rest, but Tableau is more popular than PBI
SELECT
    sd.skills,
    job_country,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE 
        job_title_short = 'Data Analyst'
    AND job_country = 'United States'
GROUP BY sd.skills, job_country
ORDER BY demand_count DESC
LIMIT 10
;

-- Let's see demand for job in Mexico
-- Answer: same as the rest, but Tableau and Power BI are equally popular
SELECT
    sd.skills,
    job_country,
    COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jp
LEFT JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE 
        job_title_short = 'Data Analyst'
    AND job_country = 'Mexico'
GROUP BY sd.skills, job_country
ORDER BY demand_count DESC
LIMIT 10
;