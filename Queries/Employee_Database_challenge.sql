SELECT e.emp_no,
    e.first_name,
    e.last_name,
    tl.title,
    tl.from_date,
    tl.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS tl	
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rit.emp_no) rit.emp_no,
rit.first_name,
rit.last_name,
rit.title
INTO unique_titles
FROM retirement_titles AS rit
ORDER BY emp_no, to_date DESC;

SELECT COUNT (uqt.emp_no), uqt.title
FROM unique_titles AS uqt
GROUP BY title
ORDER BY COUNT(title) DESC;

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
