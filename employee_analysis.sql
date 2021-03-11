-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM "Employees" AS e
JOIN "Salaries" AS s ON
e.emp_no=s.emp_no; 

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01'

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name
FROM "Dept_Manager" AS dm
INNER JOIN "Departments" AS d
ON d.dept_no = dm.dept_no
INNER JOIN "Employees" AS e
ON dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employees" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT first_name, last_name, gender 
FROM "Employees"
WHERE first_name = 'Hercules'
	and last_name LIKE 'B%'

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employees" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_Employees" AS de
JOIN "Employees" AS e
ON de.emp_no = e.emp_no
JOIN "Departments" AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name) AS "Frequency"
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;