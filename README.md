# Pewlett-Hackard-Analysis


## Overview 
### Purpose
The purpose of this assignment was to identify the number of retiring employees and which were eligible for the mentorship program. Using the tools PostgresSQL and pgAdmin, I organized data and exported it into tables to present. This will help the company combat the potential of a sliver tsunami.

## Result
• Based on the analysis, out of about  300,000 there is around 90,000 employees that are or will be eligible for retirement really soon.
• Majority of these employees eligible for retirement are in mid-level positions that will need to be filled soon.
• Only 1,549 employees are actually eligible for the mentorship program. 
• Having this data on hand will allow PH to plan ahead  and be ready for a transition. 

## Summary
• In total there are 90,398 roles that will need to be filled before the "silver tsunami" takes place. This number represents the number of employees that could be ready to retire at any moment. 

SELECT COUNT (uqt.emp_no), uqt.title
FROM unique_titles AS uqt
GROUP BY title
ORDER BY COUNT(title) DESC;

• Based on the mentorship ebiligbilty chart, there are only 1,549 retirement employees that are eligible to mentor the next generals.

SELECT DISTINCT ON (emp_no) e.emp_no, 
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ttl.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
