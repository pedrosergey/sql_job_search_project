-- create a table that contains data science jobs

CREATE TABLE data_science_jobs (
    job_id INT PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);

-- insert some values into the table

INSERT INTO data_science_jobs (
    job_id,
    job_title,
    company_name,
    post_date
)
VALUES (
    1, 
    'Data Scientist', 
    'Alphabet Inc',
    '03-02-2024'
), (
    2, 
    'Data Analyst', 
    'Facebook',
    '04-03-2024'
);

-- add a new column

ALTER TABLE data_science_jobs
ADD COLUMN remote BOOLEAN;

-- rename a column

ALTER TABLE data_science_jobs
RENAME COLUMN post_date TO post_on;

-- set default value for a column

ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

-- insert some data to check the default

INSERT INTO data_science_jobs (
    job_id,
    job_title,
    company_name,
    post_on
)
VALUES (
    3, 
    'Business Analyst', 
    'Meta',
    '06-12-2023'
);

-- drop a column

ALTER TABLE data_science_jobs
DROP COLUMN company_name;

-- update data from the table

UPDATE data_science_jobs
SET remote = TRUE
WHERE job_id = 1;

-- drop a table

DROP TABLE data_science_jobs;