-- create three tables:

CREATE TABLE jan_23_jobs
AS (
    SELECT * 
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1
);

CREATE TABLE feb_23_jobs
AS (
    SELECT * 
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 2
);

CREATE TABLE mar_23_jobs
AS (
    SELECT * 
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 3
);