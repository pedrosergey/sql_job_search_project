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

![The graph bar of the second query](/visualizations/2_query.png "Second query")


**3. Most demanded skills:**

Using the
[third query](/project_sql/3_most_demand_skills.sql), we were able to find out which are the most demanded skills among these three roles.

Something to point out is that the Data Scientist role is the one that shares more skills with the other two, so we can say it is in the middle of both positions.

Only the top 15 skills are shown in the graph, and as can be seen, there are just 4 (SQL, Python, and two cloud providers) that are shared by all of the roles.

![The graph bar of the third query](/visualizations/3_query.png "Third query")

**4. Best-paying skills:**

We were able to retrieve the most payed skill per role by using [this query](/project_sql/4_top_skills_salary.sql). As it can be see in the next table, there are some specific skills what lead the ranking for each of the roles.

|                    | Data Scientist | Data Analyst | Data Engineer |
|--------------------|----------------|--------------|---------------|
**1**	| gdpr |	bitbucket |	mongo
**2**	| golang |	pyspark |	ggplot2
**3**	| atlassian |	terraform |	seaborn
**4**	| opencv |	unify |	ubunty
**5**	| microstrategy |	couchbase |	rust

**5. Most optimal skills:**

And finally, using all the analysis that we have been making throughout this project, we arrive at the final queries, where we determine what the 15 most optimal skills to learn for each of the roles are, based on the most demanded and best paid.

The following contains the 15 most demanded skills, sorted by average salary, for each of the roles.

| Data Scientist | Data Analyst | Data Engineer |
|----------------|--------------|---------------|
| **pytorch**           |	go          |	kafka
| **tensorflow**        |	azure       |	scala
| *scikit-learn*    |	aws	        | **spark**
| aws               |	oracle      |	airflow
| **spark**         |	looker      |	java
| *pandas*          |	*python*    |	redshift
| tableau           |	sap         |	snowflake
| *python*          |	r           |	hadoop
| *sql*             |	tableau     |	aws
| azure             |	sas         |	databricks
| r                 |	*sql*       |  	*python*
| *git*             |	**power bi**| 	**gcp**
| sas               |	powerpoint  |	*sql*
| *excel*           |	*excel*     |	*git*
| **power bi**      |	word	    |   azure

As can be seen, there are different types of skills, like programming (Python, SQL, Scala), libraries (Scikit-learn, Pandas), or cloud providers (AWS, Azure, GCP).

I have already use *some of them* and I am planning to deeply learn **some others**.


## Key learnings included 🧠

Between other things, through the development of this awesome project, we were able to learn key components in the day in the life of a data nerd:

**Data Storage and Extraction**: How to create and manage a database and extract relevant data from it using SQL.

**Aggregation**: Using SQL functions to compute averages, counts, and other aggregations.

**CTEs**: Leveraging Common Table Expressions to simplify complex queries and improve readability and performance.

**Data Visualization and Storytelling**: Utilizing tools like Google Sheets to create insightful visualizations from the SQL query results. Using those visuals along with other components (like tables) to start with a generic topic and finish with some really valuable insights.

## Conclusions 🏆

First and foremost, I would like to share my gratitude with the course creators [Luke Barousse](https://www.linkedin.com/in/luke-b/) and [Kelly Adams](https://www.linkedin.com/in/kellyjianadams/), for their awesome work and all the dedication. Thanks a lot, guys! 💪🏽

Then, unifying the most optimal skills to learn with my personal likes and the current position of my career, I have decided on my roadmap of knowledge for the short-term.

As for now, I am about to finish this wonderful **SQL** project and I am currently enrolled in a 90-day **Python** bootcamp, in order to keep growing my programming skills.

In my current position as a Technical Support Representative for **Google Cloud Platform**, I am learning firsthand a wide range of topics related to **cloud computing**.

As my first step in the data world was **PowerBI** and because it is a tool that I love, my next objective is to deeply learn this wonderful tool, by combining the theoretical aspects of some courses with some personal projects that I have with a very good friend.

After that, and because of its importance in the world of data, I will be focusing on **Spark**, **PyTorch**, **TensorFlow** and finally, though it does not appear on the list, **MongoDB** as a non-relational database.

I have already been in contact with these tools, but I really want to learn them and try to master them as much as I can.

It will be a lovely path that I will be more than pleased to cover 🚀

Rest at the end, not in the middle ⚫🐍

