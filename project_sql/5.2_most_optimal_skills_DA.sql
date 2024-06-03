-- get the most optimal skills to learn, based on the 4 previous queries

WITH demanded_skills AS(
    SELECT
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as number_of_positions,
        'Data Analyst' AS role
    FROM    
        skills_job_dim
    INNER JOIN
        skills_dim 
        ON
        skills_job_dim.skill_id = skills_dim.skill_id
    INNER JOIN
        job_postings_fact jobs
        ON
        skills_job_dim.job_id = jobs.job_id
    WHERE
        jobs.job_title_short = 'Data Analyst' 
        AND
        (job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
            OR
            job_work_from_home IS TRUE)
    GROUP BY
        skills_dim.skills
    ORDER BY 
        2 DESC
    LIMIT 15
), avg_salary_skills AS(
    SELECT 
        skills_dim.skills,
        AVG(salary_year_avg) AS avg_salary,
        'Data Analyst' AS role
    FROM    
        skills_job_dim
    INNER JOIN
        job_postings_fact jobs
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
        AND
        (job_country IN ('Spain', 'Germany', 'Switzerland', 'Ireland', 'Canada')
        OR
        job_work_from_home IS TRUE)
    GROUP BY
        skills_dim.skills
    ORDER BY
        avg_salary DESC
        )

SELECT
    demanded_skills.skills, 
    demanded_skills.number_of_positions,
    avg_salary_skills.avg_salary
FROM
    demanded_skills
    LEFT JOIN
    avg_salary_skills
ON
    demanded_skills.skills = avg_salary_skills.skills
