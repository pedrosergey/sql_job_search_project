-- categorize the jobs into jobs with and withouth salary

(SELECT 
    job_id,
    job_title,
    salary_year_avg,
    salary_hour_avg,
    'Yes' AS salary_provided
FROM
    job_postings_fact
WHERE
    salary_hour_avg IS NOT NULL
    OR
    salary_hour_avg IS NOT NULL)

UNION ALL

(SELECT 
    job_id,
    job_title,
    salary_year_avg,
    salary_hour_avg,
    'No' AS salary_provided
FROM
    job_postings_fact
WHERE
    salary_hour_avg IS NULL
    AND
    salary_hour_avg IS NULL)

ORDER BY
    salary_provided,
    job_id

-- get the jobs of the first quarter above 70K with their skills

WITH first_quarter_jobs AS(
    SELECT 
        job_id,
        job_title_short,
        job_location,
        job_via
    FROM
        jan_23_jobs
    WHERE
        salary_year_avg > 70000

    UNION ALL

    SELECT 
        job_id,
        job_title_short,
        job_location,
        job_via
    FROM
        feb_23_jobs
    WHERE
        salary_year_avg > 70000

    UNION ALL

    SELECT 
        job_id,
        job_title_short,
        job_location,
        job_via
    FROM
        mar_23_jobs
    WHERE
        salary_year_avg > 70000
), skills AS(
    SELECT
        skills_job_dim.job_id,
        skills_dim.skill_id,
        skills_dim.skills,
        skills_dim.type
    FROM
        skills_dim 
    INNER JOIN
        skills_job_dim
    ON
        skills_dim.skill_id = skills_job_dim.skill_id
)

SELECT 
    jobs.job_id,
    jobs.job_title_short,
    jobs.job_location,
    jobs.job_via,
    skills.skills,
    skills.type AS skill_type
FROM
    first_quarter_jobs AS jobs
LEFT JOIN 
    skills
ON 
    jobs.job_id = skills.job_id

-- demand per skill in the first quarter

(
SELECT 
    skill_id,
    job_count,
    'January' AS Month_posted
FROM(
    SELECT
        skills.skill_id,
        COUNT(jobs.job_id) AS job_count
    FROM
     jan_23_jobs jobs
    INNER JOIN
     skills_job_dim skills
    ON
      jobs.job_id = skills.job_id
    GROUP BY
     skills.skill_id
)

UNION ALL

SELECT 
    skill_id,
    job_count,
    'February' AS Month_posted
FROM(
    SELECT
        skills.skill_id,
        COUNT(jobs.job_id) AS job_count
    FROM
     feb_23_jobs jobs
    INNER JOIN
     skills_job_dim skills
    ON
      jobs.job_id = skills.job_id
    GROUP BY
     skills.skill_id
)

UNION ALL

SELECT 
    skill_id,
    job_count,
    'March' AS Month_posted
FROM(
    SELECT
        skills.skill_id,
        COUNT(jobs.job_id) AS job_count
    FROM
     mar_23_jobs jobs
    INNER JOIN
     skills_job_dim skills
    ON
      jobs.job_id = skills.job_id
    GROUP BY
     skills.skill_id
)
)

ORDER BY 
    skill_id, month_posted

