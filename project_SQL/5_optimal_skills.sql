/*
Question: What are the most optimal skills to learn, that is, the highest paying and the most demanded?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote position with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries)
*/

WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jp
    LEFT JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
    LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
    WHERE 
            job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
    GROUP BY sd.skill_id
),

skills_pay AS (
SELECT
    sd.skill_id,
    sd.skills,
--  job_country,
    ROUND(AVG(salary_year_avg)) AS avg_salary,
    COUNT(jp.job_id) AS count_postings
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE
            job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
        AND salary_year_avg IS NOT NULL
--  AND job_work_from_home = True
--  AND job_country = 'United States'
GROUP BY 
    sd.skill_id
--  ,job_country
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count, 
    avg_salary
FROM 
    skills_demand
INNER JOIN skills_pay ON skills_demand.skill_id = skills_pay.skill_id
WHERE demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
    


