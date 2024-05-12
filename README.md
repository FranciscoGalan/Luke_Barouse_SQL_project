# Introduction
Focusing on data analyst roles, this project 💡 explores top-paying jobs, 📡 in-demand skills,and 📊 where high demand meets high salary in data analytics.

SQL queries? Check them out here:
- [project_sql folder](/project_sql/1_top_paying_jobs.sql)

# Background
The questions I wanted to answer through my SQL queries were: 
1. What are the top-paying data analyst jobs?
2. What skills are required for the top-paying data analyst jobs?
3. What are the most in-demand skills for data analysts?
4. What are the top skills based on salary?
5. What are the most optimal skills to learn, that is, the highest paying and the most demanded?

# Tools I Used

- **SQL**: the backbone of my analysis
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. 

Example: query for most-demanded skills (question 3)
```sql
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
```

# Insights

1. The most demanded skills for data analyst positions in 2023 were these:

```
Skills       | Demand Count
----------------------------
SQL          | **************
Excel        | **********
Python       | ********
Tableau      | ******
Power BI     | *****
R            | ****
SAS          | ****
PowerPoint   | **
Word         | **
SAP          | *
```
_Note: Each asterisk (*) represents approximately 10,000 in demand count_


2. The top-paying positions involve roles as Director, Manager, or "Principal" roles.

3. In the highest-paying jobs, these were the most demanded skills:

    a. **SQL**: SQL is the most frequently mentioned skill, appearing in every job posting.

    b. **Python**: Python is another highly sought-after skill, present in almost all job postings.

    c. **R**: this programming language is also in demand, although not as prevalent as SQL and Python.

    d. **Tableau**: Data visualization tool Tableau is prominently requested across many job postings.

4. In general, the skills associated with the highest-paying jobs have these features:

    **High-Demand Technical Skills**: Deep learning frameworks like PyTorch and TensorFlow, along with distributed data processing tools such as Apache Kafka and Apache Cassandra, command top salaries, reflecting the growing demand for expertise in advanced data analysis techniques.

    **Workflow Management Tools**: Tools like Apache Airflow are crucial for automating and orchestrating data analysis pipelines, indicating a need for proficiency in workflow management among data analysts.

