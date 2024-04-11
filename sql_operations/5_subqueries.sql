-- top 5 most skills mentioned in job postings

SELECT
    *
FROM 
    skills_dim
WHERE 
    skill_id IN
    (SELECT
        skill_id
    FROM
        skills_job_dim
    GROUP BY 
        skill_id
    ORDER BY 
        COUNT(job_id) DESC
    LIMIT 5)

SELECT 
    skills.skills,
    count_of_skills.skill_count
FROM   
    skills_dim skills
INNER JOIN
    (SELECT 
        skill_id,
        COUNT(job_id) AS skill_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5) as count_of_skills
ON skills.skill_id = count_of_skills.skill_id

-- categorize the companies depending on the number of jobs posted

WITH company_names AS (
    SELECT 
        DISTINCT jobs.company_id,
        company.name
    FROM    
        job_postings_fact jobs
    LEFT JOIN
        company_dim company
    ON jobs.company_id = company.company_id
)

SELECT 
    companies_distribution.company_id,
    company_names.name,
    CASE 
    WHEN jobs_posted > 50 THEN 'Large'
    WHEN jobs_posted BETWEEN 10 AND 50 THEN 'Medium'
    ELSE 'Small'
    END AS company_size
FROM
    (SELECT
        company_id,
        COUNT(job_id) AS jobs_posted
    FROM
        job_postings_fact
    GROUP BY
        company_id) AS companies_distribution
LEFT JOIN
    company_names
    ON
    company_names.company_id = companies_distribution.company_id
ORDER BY
    company_id

-- companies with higher salary than overal average

SELECT
    company_id,
    name
FROM
    company_dim
WHERE
    company_id IN
    (SELECT 
        company_id
    FROM
        job_postings_fact
    GROUP BY
        company_id
    HAVING 
        AVG(salary_year_avg) >
        (SELECT 
            AVG(salary_year_avg) as avg_salary
        FROM
            job_postings_fact)
    )
ORDER BY    
    company_id ASC