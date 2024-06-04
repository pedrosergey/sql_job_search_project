# Data Job Analysis 🤓

## Introduction 🌱

This repository contains a personal analysis of some jobs in the data field. As I am currently developing new skills and perfecting the ones I already have, this course will be very beneficial in determining the next steps to continue growing in the most optimal way.

I have followed the awesome [SQL for Data Analytics course](https://youtu.be/7mz73uXD9DA?si=Myye5t7yX8qJcqde) from [Luke Barousse](https://www.linkedin.com/in/luke-b/) and [Kelly Adams](https://www.linkedin.com/in/kellyjianadams/).

I have adapted the course to my personal preferences, focusing on jobs for Data Scientists, Data Analysts, and Data Engineers, where the positions are in Germany, Switzerland, Ireland, Canada, Spain, or offer the option of working from home.

## Background 👾

In today's data-driven world, understanding the job market for data-related positions is crucial for professionals looking to advance their careers. This project analyzes job data to uncover valuable insights regarding top-paying jobs, most demanded skills, and optimal skills for career development.

The analysis is based on a comprehensive dataset that includes salaries, locations, job types, required skills, and other characteristics.

## Tools I Used 🛠️

**SQL:** The main tool that allowed us to perform the analysis.

**PostgreSQL:** The chosen database management system.

**VSCode:** As the code editor to access the database and run the SQL queries.

**Google Sheets:** For creating visualizations to better understand and present the findings.

**Git & GitHub:** For version control and sharing the project with other people.



## The Analysis 📊

The analysis was conducted through a [series of SQL queries](/project_sql/) designed to extract meaningful insights from the dataset. 

Below are the key queries used:

**1. Top paying jobs:**

With the [first query](/project_sql/1_top_paying_jobs.sql), we noticed some initial insights about the jobs. The results shown below are from the top 100 best-paying jobs for each of the roles.

Despite some outliers, Data Scientists have a higher average salary per year, followed by Data Engineers. Data Analyst jobs are the least paid among these three.

|                    | Data Scientist | Data Analyst | Data Engineer |
|--------------------|----------------|--------------|---------------|
| **Avg**            | 239,442        | 151,707      | 204,691       |
| **Max**            | 550,000        | 650,000      | 375,000       |
| **Min**            | 205,000        | 122,500      | 175,000       |

**2. Skills of the top paying jobs:**

Thanks to the [second query](/project_sql/2_skills_top_paying_jobs.sql), we were able to determine which skills were required for the top 100 best-paying jobs from the first query.

As a result, we got the following bar graph, where the skills are divided by role. Note that only the skills that appeared more than 10 times are shown in the graph.

[second query](//visualizations/2_query.png)


**3. Most demanded skills:**

[](/project_sql/3_most_demand_skills.sql)

**4. Best-paying skills:**

[](/project_sql/4_top_skills_salary.sql)

**5. Most optimal skills:**



Throughout this project, I enhanced my SQL skills, ranging from basic queries to more advanced techniques such as Common Table Expressions (CTEs). 

## Key learnings include 🧠

Data Extraction: How to extract relevant data from a large dataset using SQL.
Aggregation: Using SQL functions to compute averages, counts, and other aggregations.
CTEs: Leveraging Common Table Expressions to simplify complex queries and improve readability.
Data Visualization: Utilizing tools like Google Sheets to create insightful visualizations from the SQL query results.

## Conclusions 🏆

This project provided valuable insights into the data job market. By analyzing salary data and skill demands, we identified the most lucrative and in-demand skills for data professionals. The findings can guide individuals in their career development and skill acquisition strategies. Additionally, the project served as a practical application of SQL, reinforcing both basic and advanced querying techniques.