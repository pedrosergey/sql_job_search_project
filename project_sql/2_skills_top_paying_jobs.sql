-- what are the skills required for the top paying jobs

WITH skills AS(
    SELECT 
        jobs.job_id,
        skills.skills
    FROM 
        skills_job_dim jobs
    INNER JOIN
        skills_dim skills
            ON
        skills.skill_id = jobs.skill_id
)

(SELECT 
    jobs.job_id,
    company.name AS company_name,
    jobs.job_country,
    jobs.job_title,
    jobs.job_via,
    jobs.salary_year_avg,
    skills.skills,
    'Data Scientist' AS role
FROM
    job_postings_fact jobs
LEFT JOIN 
    company_dim company
    ON
    company.company_id = jobs.company_id
INNER JOIN
    skills 
    ON
    skills.job_id = jobs.job_id
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
LIMIT 50)

UNION ALL

(SELECT 
    jobs.job_id,
    company.name AS company_name,
    jobs.job_country,
    jobs.job_title,
    jobs.job_via,
    jobs.salary_year_avg,
    skills.skills,
    'Data Engineer' AS role
FROM
    job_postings_fact jobs
LEFT JOIN 
    company_dim company
    ON
    company.company_id = jobs.company_id
INNER JOIN
    skills 
    ON
    skills.job_id = jobs.job_id
WHERE
    (jobs.job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
    OR
    jobs.job_work_from_home IS TRUE)
    AND
    job_title_short = 'Data Engineer'
    AND 
    jobs.salary_year_avg IS NOT NULL
ORDER BY
    jobs.salary_year_avg DESC
LIMIT 50)

UNION ALL

(SELECT 
    jobs.job_id,
    company.name AS company_name,
    jobs.job_country,
    jobs.job_title,
    jobs.job_via,
    jobs.salary_year_avg,
    skills.skills,
    'Data Analyst' AS role 
FROM
    job_postings_fact jobs
LEFT JOIN 
    company_dim company
    ON
    company.company_id = jobs.company_id
INNER JOIN
    skills 
    ON
    skills.job_id = jobs.job_id
WHERE
    (jobs.job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
    OR
    jobs.job_work_from_home IS TRUE)
    AND
    job_title_short = 'Data Analyst'
    AND 
    jobs.salary_year_avg IS NOT NULL
ORDER BY
    jobs.salary_year_avg DESC
LIMIT 50)