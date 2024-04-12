-- what are the top paying jobs for my roles

SELECT 
    jobs.job_id,
    company.name AS company_name,
    jobs.job_country,
    jobs.job_title,
    jobs.job_via,
    jobs.salary_year_avg
FROM
    job_postings_fact jobs
LEFT JOIN 
    company_dim company
    ON
    company.company_id = jobs.company_id
WHERE
    (jobs.job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
    OR
    jobs.job_work_from_home IS TRUE)
    AND
    job_title_short = 'Data Scientist'
    AND 
    jobs.salary_year_avg IS NOT NULL
ORDER BY
    jobs.salary_year_avg DESC
LIMIT 100