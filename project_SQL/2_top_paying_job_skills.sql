/*
Question 2: What skills are required for the top-paying data analyst jobs?
- Use the top 20 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at whcih high-paying jobs demand certain skills. 
    In turn, this helps job seekers understand which skills to learn to earn more. 
*/

WITH top_paying_jobs AS (
    SELECT
        jp.job_id,
        job_title,
        c.name,
        job_schedule_type,
        ROUND(salary_year_avg) AS salary_year_avg_
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
)

SELECT
    tpj.job_id,
    tpj.job_title,
    tpj.name AS company_dim,
    tpj.job_schedule_type,
    tpj.salary_year_avg_,
    sjd.skill_id,
    sd.skills AS skill
FROM top_paying_jobs tpj
LEFT JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
ORDER BY tpj.salary_year_avg_ DESC
;

/* Conclusions:
This is what Chat GPT mentioned when I asked it to find insights for the skill column:

1. **SQL**: SQL is the most frequently mentioned skill, appearing in every job posting.

2. **Python**: Python is another highly sought-after skill, present in almost all job postings.

3. **R**: R programming language is also in demand, although not as prevalent as SQL and Python.

4. **Tableau**: Data visualization tool Tableau is prominently requested across many job postings.

5. **Azure**: Skills related to Microsoft Azure, such as Azure itself and Azure Databricks, are increasingly important.

6. **AWS**: Competency in Amazon Web Services (AWS) is also valued by many employers.

7. **Pandas and PySpark**: These Python libraries for data manipulation and analysis are frequently mentioned alongside Python.

8. **Excel**: Although not a programming language, proficiency in Excel remains an essential skill for data analysts.

9. **Power BI**: Microsoft Power BI for business analytics and visualization is mentioned in several job postings.

10. **Git**: Version control system Git is mentioned in a few job postings, indicating a need for collaboration and code management skills.

These insights highlight the diverse skill set expected from data analysts, encompassing programming languages, database management systems, data visualization tools, cloud platforms, and more. Candidates with a combination of these skills would likely be competitive in the job market.

*/