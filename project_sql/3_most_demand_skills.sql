-- get the most demanded skills per my focus roles

WITH jobs AS(
    SELECT 
        job_id,
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
    COUNT(skills_job_dim.job_id),
    'Data Scientist' AS role
FROM    
    skills_job_dim
INNER JOIN
    skills_dim 
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
WHERE
    jobs.job_title_short = 'Data Scientist'
GROUP BY
    skills_dim.skills
ORDER BY 
    2 DESC
LIMIT 10)

UNION ALL

(SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id),
    'Data Engineer' AS role
FROM    
    skills_job_dim
INNER JOIN
    skills_dim 
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
WHERE
    jobs.job_title_short = 'Data Engineer'
GROUP BY
    skills_dim.skills
ORDER BY 
    2 DESC
LIMIT 10)

UNION ALL

(SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id),
    'Data Analyst' AS role
FROM    
    skills_job_dim
INNER JOIN
    skills_dim 
    ON
    skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN
    jobs
    ON
    skills_job_dim.job_id = jobs.job_id
WHERE
    jobs.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY 
    2 DESC
LIMIT 10)

