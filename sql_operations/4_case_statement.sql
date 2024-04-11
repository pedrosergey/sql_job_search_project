-- categorize the salary 

SELECT
    jobs.job_id,
    jobs.job_title,
    jobs.salary_year_avg, 
    company.name AS company_name,
    CASE
        WHEN salary_year_avg > 100000 THEN 'High salary'
        WHEN salary_year_avg > 60000 THEN 'High salary'
        ELSE 'Low salary'
    END AS salary_cateogry
FROM
    job_postings_fact jobs
    LEFT JOIN
    company_dim company
    ON
    jobs.company_id = company.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC



-- number of unique companies that offer work from home


SELECT
    COUNT(DISTINCT CASE
        WHEN job_work_from_home = TRUE THEN company_id
        END) as work_from_home,
    COUNT(DISTINCT CASE
        WHEN job_work_from_home = FALSE THEN company_id
        END) as non_work_from_home
FROM
    job_postings_fact

-- categorize the job neccesary experience 

SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Lead%' OR job_title ILIKE '%Manager%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home IS TRUE THEN 'Yes'
        ELSE 'No'
    END AS job_work_from_home
FROM 
    job_postings_fact
ORDER BY
    job_id