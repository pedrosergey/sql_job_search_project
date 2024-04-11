-- avg salary hour/year per schedule type, 
-- jobs posted later than 1st June, 2023

SELECT 
    job_schedule_type,
    AVG(salary_hour_avg) AS avg_salary_hour,
    AVG(salary_year_avg) AS avg_salary_year
FROM
    job_postings_fact
WHERE
    job_posted_date >= '2023-06-01'
    AND
    job_schedule_type IS NOT NULL
GROUP BY
    job_schedule_type
HAVING
    AVG(salary_hour_avg) IS NOT NULL
    OR
    AVG(salary_year_avg) IS NOT NULL
ORDER BY
    job_schedule_type ASC


Count the number of job postings for each month in 2023, 
adjusting the job_posted_date to be in 'America/New_York' 
time zone before extracting the month. 
Assume the job_posted_date is stored in UTC. 
Group by and order by the month.


-- count the number of job listed each month of
-- 2023, having the timezone of New York

SELECT 
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT') AS job_posted_month,
    COUNT(job_id)
FROM
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT') = 2023
GROUP BY
    job_posted_month
ORDER BY
    job_posted_month ASC

-- count the number of job post per company,
-- that included insurance during 2nd quarter or
-- 2023

SELECT
    company.name copmany_name,
    COUNT(job_id) as number_of_posts_with_insurance
FROM
    job_postings_fact jobs
    LEFT JOIN
    company_dim company
    ON
    jobs.company_id = company.company_id
WHERE
    job_health_insurance IS TRUE
    AND
    EXTRACT(QUARTER FROM job_posted_date) = 2
    AND
    AND
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    copmany_name
ORDER BY 
    number_of_posts_with_insurance DESC


