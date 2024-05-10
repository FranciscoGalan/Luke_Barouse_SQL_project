/*
Question: What are the top skills based on salary?
- In other words, what is the average salary associated with a skill
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts.
*/

SELECT
    sd.skills,
--  job_country,
    ROUND(AVG(salary_year_avg)) AS avg_salary,
    COUNT(jp.job_id) AS count_postings
FROM job_postings_fact jp
INNER JOIN skills_job_dim sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
WHERE
        job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
--  AND job_work_from_home = True
--  AND job_country = 'United States'
GROUP BY 
    sd.skills
--  ,job_country
HAVING
    COUNT(jp.job_id) > 10
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Conclusions, 

Short insights from ChatGPT:

Here are three key insights from the top paying skills for data analysts:

1. **High-Demand Technical Skills**: Deep learning frameworks like PyTorch and TensorFlow, along with distributed data processing tools such as Apache Kafka and Apache Cassandra, command top salaries, reflecting the growing demand for expertise in advanced data analysis techniques.

2. **Workflow Management Tools**: Tools like Apache Airflow are crucial for automating and orchestrating data analysis pipelines, indicating a need for proficiency in workflow management among data analysts.

3. **Unusual Inclusions**: Some skills like Perl and Atlassian Suite (Confluence) are less common in traditional data analyst roles, suggesting specific job requirements or industry preferences that deviate from typical expectations.



Long-form insight:

Here are some insights and trends for the top paying skills for data analysts based on the provided data:

1. **Apache Kafka**: With an average salary of $129,999 and 40 job postings, Apache Kafka skills are highly valued in the data analyst role. Kafka is a distributed streaming platform widely used for building real-time data pipelines and streaming applications.

2. **PyTorch**: PyTorch, a deep learning framework, commands an average salary of $125,226 with 20 job postings. This suggests a growing demand for data analysts with expertise in deep learning and neural networks.

3. **Perl**: Perl, a scripting language, surprisingly appears in the top paying skills list with an average salary of $124,686. However, Perl is more commonly associated with software development rather than data analysis, so its inclusion here might be unusual.

4. **TensorFlow**: TensorFlow, another deep learning framework, offers an average salary of $120,647 with 24 job postings. Similar to PyTorch, this indicates a need for data analysts skilled in machine learning and artificial intelligence.

5. **Apache Cassandra**: Cassandra, a distributed NoSQL database, has an average salary of $118,407 with 11 job postings. Knowledge of Cassandra suggests involvement in handling large-scale data storage and management tasks.

6. **Atlassian Suite (Confluence)**: Atlassian tools like Confluence, with an average salary of $114,153 and 62 job postings, are not typical skills for data analysts. Confluence is more commonly used for collaboration and project management rather than data analysis tasks.

7. **Apache Airflow**: Airflow, a workflow automation and scheduling tool, offers an average salary of $116,387 with 71 job postings. Its inclusion reflects the importance of workflow management in data analysis pipelines.

8. **Scala**: Scala, a programming language, commands an average salary of $115,480 with 59 job postings. Scala is often used in big data processing frameworks like Apache Spark, indicating a need for skills in distributed computing.

9. **Linux and Unix**: Proficiency in Linux and Unix operating systems is valued, with average salaries of $114,883 and $111,123 respectively. These skills are essential for data analysts working in environments where these operating systems are prevalent.

10. **Git**: Git, a version control system, offers an average salary of $112,250 with 74 job postings. While important for collaborative software development, Git skills are also valuable for managing data analysis code and projects.

These insights highlight the diverse skill set required for high-paying data analyst roles, ranging from deep learning frameworks to database management systems and workflow automation tools. Additionally, it's important to note the inclusion of some skills like Perl and Atlassian Suite (Confluence), which may not be typical for data analysts and might indicate specific job requirements or industry preferences.




*/