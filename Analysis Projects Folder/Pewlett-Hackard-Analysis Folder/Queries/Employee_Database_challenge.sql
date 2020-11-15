-- Deliverable 1
-- 1. Create a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN  '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- 2. The Retirement Titles table is exported as retirement_titles.csv
-- This file is available in the data folder

-- 3. Create a Unique Titles table that contains the employee number, first and last name, and most recent title
SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY (emp_no) ASC,to_date DESC;

-- 4. The Unique Titles table is exported as unique_titles.csv
-- This file is available in the data folder

-- 5. Create a Retiring Titles table that contains the number of titles filled by employees who are retiring.
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
FROM unique_titles
GROUP BY(title)
ORDER BY COUNT DESC;

-- 6. The Retiring Titles table is exported as retiring_titles.csv
-- This file is available in the data folder

-- Deliverable 2
-- 1. create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN  '1965-01-01' AND '1965-12-31')
AND to_date = '9999-01-01';

-- 2. The Mentorship Eligibility table is exported and saved as mentorship_eligibilty.csv. 
-- This file is available in the data folder

---------------------------------------------------------------------------------------------------------------------------------------------------
-- The below queries are created in below steps as mentioned in the submission deliverables.
-- Deliverable 1
-- 1.Retrieve the emp_no, first_name, and last_name columns from the Employees table.
 
SELECT emp_no,first_name,last_name
FROM employees;	

-- 2. Retrieve the title, from_date, and to_date columns from the Titles table.

SELECT title, from_date, to_date
FROM titles;	

-- 3. Create a new table using the INTO clause.
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date	
INTO retirement_titles;

-- 4. Join both tables on the primary key.
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no);

-- 5. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN  '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- 6. Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- This is done by right click on the table named retirement_titles,select Import/Export, save file as csv by selecting appropriate fields.

-- 7.Before you export your table, confirm that it looks like this image:
-- image 2

-- 8.Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
ORDER BY _____, _____ DESC;

-- 9.Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- These columns will be in the new table that will hold the most recent title of each employee.

SELECT emp_no,first_name,last_name,title 
FROM retirement_titles;

-- 10.Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

SELECT DISTINCT on(emp_no) emp_no,first_name, last_name, title
FROM retirement_titles
ORDER BY (emp_no);

-- 11.Create a Unique Titles table using the INTO clause.

SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles

-- 12.Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.

ORDER BY (emp_no) ASC,to_date DESC;

-- 13.Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- This is done by right click on the table named unique_titles,select Import/Export, save file as csv by selecting appropriate fields.

-- 14.Before you export your table, confirm that it looks like this image:
-- image 3

-- 15.Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.

-- 16. First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT(title) FROM unique_titles;

-- 17. Then, create a Retiring Titles table to hold the required information.
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
FROM unique_titles

-- 18. Group the table by title, then sort the count column in descending order.
GROUP BY(title)
ORDER BY COUNT DESC

-- 19.Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- This is done by right click on the table named retiring_titles,select Import/Export, save file as csv by selecting appropriate fields.

-- 20.Before you export your table, confirm that it looks like this image:
-- image 4

-- 21.Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder.
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Deliverable 2
-- 1.Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

SELECT emp_no,first_name,last_name,birth_date
FROM employees ;

-- 2.Retrieve the from_date and to_date columns from the Department Employee table.

SELECT from_date,to_date
FROM dept_emp;

-- 3.Retrieve the title column from the Titles table.
SELECT title FROM titles;

-- 4.Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,birth_date
FROM employees 
ORDER BY (emp_no);

-- 5.Create a new table using the INTO clause.
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date
INTO mentorship_eligibility

-- 6.Join the Employees and the Department Employee tables on the primary key.
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no);

-- 7.Join the Employees and the Titles tables on the primary key.
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no);


-- 8.Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.
SELECT DISTINCT ON (emp_no)emp_no, first_name, last_name,birth_date,from_date,to_date,title
FROM mentorship_eligibility 
WHERE (birth_date BETWEEN  '1965-01-01' AND '1965-12-31')
AND to_date = '9999-01-01'

-- 9.Order the table by the employee number.
ORDER BY emp_no ASC;

-- 10.Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- This is done by right click on the table named mentorship_eligibilty,select Import/Export, save file as csv by selecting appropriate fields.

-- 11.Before you export your table, confirm that it looks like this image:
-- image 5
