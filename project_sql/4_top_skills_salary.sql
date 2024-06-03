-- get the top skills based on the average salary

WITH jobs AS(
    SELECT 
        job_id,
        salary_year_avg,
        job_title_short
    FROM
        job_postings_fact
    WHERE
        (job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
        OR
        job_work_from_home IS TRUE)
        AND
        job_title_short IN ('Data Scientist', 'Data Analyst', 'Data Engineer')
    )

(SELECT 
    skills_dim.skills,
    AVG(salary_year_avg) AS avg_salary,
    'Data Scientist' AS role
FROM    
    skills_job_dim
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
INNER JOIN
    skills_dim 
    ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Scientist'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC)

UNION ALL

(SELECT 
    skills_dim.skills,
    AVG(salary_year_avg) AS avg_salary,
    'Data Analyst' AS role
FROM    
    skills_job_dim
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
INNER JOIN
    skills_dim 
    ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC)

UNION ALL

(SELECT 
    skills_dim.skills,
    AVG(salary_year_avg) AS avg_salary,
    'Data Engineer' AS role
FROM    
    skills_job_dim
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
INNER JOIN
    skills_dim 
    ON
    skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Engineer'
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC)