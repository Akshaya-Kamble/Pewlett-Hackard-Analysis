# Pewlett-Hackard-Analysis

## Overview of the Employee Database with SQL
In this project we are helping Bobby to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. After these findings we are also going to help prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

For this analysis we have used the following version of softwares 
1. pgAdmin 4.24 for writing the SQL querries
2. https://app.quickdatabasediagrams.com/#/ for building the ERD
3. Importing data and exporting data in csv formats.

## Results.
### 1. Join tables to get data and filter data as required.
We joined the two tables employees and tables using inner join and created a new table named retirement_titles using the primary key emp_no which is common in both tables. Thenwe filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955.This gives us the filtered data in the range of years into a new table.
We have this table saved as image 2 in the  reference images folder and the csv file named as retirement_titles.csv in the data folder.
#### a. Below are the links to image and csv file.
1. [Image 2][1]
2. [retirement_titles][2]
#### b. This is the query we executed to get the data
```
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
```

### 2. Remove duplicate entries.
There are duplicate entries for some employees because they have switched titles over the years.To remove these duplicates and keep only the most recent title of each employee we have used DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.Now we have a new table with without duplicate entries and current titles for all the selected employees.
We have this table saved as image 3 in the reference images folder folder and the csv file named as unique_titles.csv in the data folder.
#### a. Below are the links to image and csv file.
1. [Image 3][3]
2. [unique_titles][4]
#### b. This is the query we executed to get the data
```
SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY (emp_no) ASC,to_date DESC;
```

### 3. Get a count for retiring titles.
Using the above unique_titles table we are able to get number of employees by their most recent job title who are about to retire. To get the total count for the unique titles we have used the GROUP BY function on title and count to get this data.
We have this table saved as image 4 in the reference images folder folder and the csv file named as retiring_titles.csv in the data folder.
#### a. Below are the links to image and csv file.
1. [Image 4][5]
2. [retiring_titles][6]
#### b. This is the query we executed to get the data
```
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
FROM unique_titles
GROUP BY(title)
ORDER BY COUNT DESC;
```

### 4. Get employees who are eligible to participate in a mentorship program.
We can create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. This will give us a list of employees who are eligible to participate in a mentorship program.To get this data we have created a new table named mentorship_eligibilty by joining three tables employees,dept_emp and titles on their primary key emp_no.We also have the where clause to get the employees born on the mentioned year for the mentorship program.
We have this table saved as image 5 in the reference images folder folder and the csv file named as mentorship_eligibilty.csv in the data folder.
#### a. Below are the links to image and csv file.
1. [Image 5][7]
2. [mentorship_eligibilty][8]

#### b. This is the query we executed to get the data
```
SELECT e.emp_no,e.first_name,e.last_name,e.birth_date,d.from_date,d.to_date,ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN  '1965-01-01' AND '1965-12-31')
AND to_date = '9999-01-01';
```

## Summary
1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
We have filtered the unique_titles table to get employees born beween 1952 and 1955 and we get a count of 90398.
Refer image 6 in reference images folder for the query and output.
[Image 6][9]

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
The employees that are ready for mentorship program are 1549 who are born between January 1, 1965 and December 31, 1965.With this data we get a ratio of 1:58 and Pewlett Hackard can descide if they need to hire more mentorship eligible employees. 
Refer image 7 in reference images folder for the query and output.
[Image 7][10]

3. Number of employees in every title that will be part of 'silver tsunami'.
We have this data calculated and looking at the image 4 we can plan for retirement and mentorship programs accordingly.
Each title has a count of employess that will be part of 'silver tsunami'.
The following query has provide the required result.
```
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
FROM unique_titles
GROUP BY(title)
ORDER BY COUNT DESC;
```
Refer image 4 in reference images folder
[Image 4][5]

4. Divide the eligible 'silver tsunami' employees in batches.
The highest number of employees retiring are in the title 'Senior Engineer' and 'Senior Staff' ,we can further divide these employess in small batches to have a smooth transition of retiring employees and new employees. Doing so can also help balance the mentor and new employee ratio.
The following query has provide the required result.
```
SELECT COUNT(emp_no) as count ,title
INTO retiring_titles
FROM unique_titles
GROUP BY(title)
ORDER BY COUNT DESC;
```
Refer image 4 in reference images folder
[Image 4][5]

[1]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/2.PNG
[2]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/retirement_titles.csv
[3]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/3.PNG
[4]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/unique_titles.csv
[5]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/4.PNG
[6]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/retiring_titles.csv
[7]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/5.PNG
[8]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/mentorship_eligibilty.csv
[9]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/6.PNG
[10]:https://github.com/Akshaya-Kamble/Pewlett-Hackard-Analysis/blob/main/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Reference%20images/7.PNG
