# Data Job Analysis 🤓

## Introduction 🌱

This repository contains a personal analysis of some jobs in the data field. As I am currently developing new skills and perfecting the ones I already have, this course will be very beneficial in determining the next steps to continue growing in the most optimal way.

I have followed the awesome [SQL for Data Analytics course](https://youtu.be/7mz73uXD9DA?si=Myye5t7yX8qJcqde) from [Luke Barousse](https://www.linkedin.com/in/luke-b/) and [Kelly Adams](https://www.linkedin.com/in/kellyjianadams/).

I have adapted the course to my personal preferences, focusing on jobs for Data Scientists, Data Analysts, and Data Engineers, where the positions are in Germany, Switzerland, Ireland, Canada, Spain, or offer the option of working from home.

## Background

In today's data-driven world, understanding the job market for data-related positions is crucial for professionals looking to advance their careers. This project analyzes job data to uncover valuable insights regarding top-paying jobs, most demanded skills, and optimal skills for career development.

The analysis is based on a comprehensive dataset that includes salaries, locations, job types, required skills, and other characteristics.

## Tools I Used

**SQL:** For querying and analyzing the data.

**Google Sheets:** For creating visualizations to better understand and present the findings.

## The Analysis

The analysis was conducted through a [series of SQL queries](/project_sql/) designed to extract meaningful insights from the dataset. Below are the key queries used:

Top Paying Job:

sql
Copy code
SELECT job_title, AVG(salary) AS average_salary
FROM job_data
GROUP BY job_title
ORDER BY average_salary DESC
LIMIT 1;
Skills of the Top Paying Jobs:

sql
Copy code
SELECT skill, COUNT(*) AS demand
FROM job_data
WHERE job_title = (SELECT job_title
                   FROM job_data
                   GROUP BY job_title
                   ORDER BY AVG(salary) DESC
                   LIMIT 1)
GROUP BY skill
ORDER BY demand DESC;
Most Demanded Skills:

sql
Copy code
SELECT skill, COUNT(*) AS demand
FROM job_data
GROUP BY skill
ORDER BY demand DESC
LIMIT 10;
Top Salary Skills:

sql
Copy code
SELECT skill, AVG(salary) AS average_salary
FROM job_data
GROUP BY skill
ORDER BY average_salary DESC
LIMIT 10;
Most Optimal Skills:

sql
Copy code
WITH skill_demand AS (
    SELECT skill, COUNT(*) AS demand
    FROM job_data
    GROUP BY skill
),
skill_salary AS (
    SELECT skill, AVG(salary) AS average_salary
    FROM job_data
    GROUP BY skill
)
SELECT sd.skill, sd.demand, ss.average_salary
FROM skill_demand sd
JOIN skill_salary ss ON sd.skill = ss.skill
ORDER BY sd.demand DESC, ss.average_salary DESC;
What I Learned

Throughout this project, I enhanced my SQL skills, ranging from basic queries to more advanced techniques such as Common Table Expressions (CTEs). 

## Key learnings include:

Data Extraction: How to extract relevant data from a large dataset using SQL.
Aggregation: Using SQL functions to compute averages, counts, and other aggregations.
CTEs: Leveraging Common Table Expressions to simplify complex queries and improve readability.
Data Visualization: Utilizing tools like Google Sheets to create insightful visualizations from the SQL query results.

## Conclusions

This project provided valuable insights into the data job market. By analyzing salary data and skill demands, we identified the most lucrative and in-demand skills for data professionals. The findings can guide individuals in their career development and skill acquisition strategies. Additionally, the project served as a practical application of SQL, reinforcing both basic and advanced querying techniques.