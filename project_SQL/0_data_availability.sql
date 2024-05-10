-- Date range of the data
-- It goes from Dec 2022 to Dec 2023
SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS date_year,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    COUNT(job_id)
FROM job_postings_fact
GROUP BY date_year, date_month
ORDER BY date_year, date_month;


-- When was the first posting registered?
-- 31 Dec 2022, whereas in the app Luke has data starting from 23 Dec 2022 
SELECT 
    MIN(job_posted_date)
FROM job_postings_fact
;


