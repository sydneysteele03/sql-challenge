--1. list the employee number, last name, first name, sex, and salary of each employee.
SELECT 
first_name, last_name, sex, salary 
FROM employees 
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date LIKE '%1996';


--3. List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name 
FROM dept_manager
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no;


--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT dept_emp.dept_no, employees.emp_no, last_name, first_name, dept_name 
FROM employees INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments 
ON dept_emp.dept_no = departments.dept_no;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B.
SELECT first_name, last_name, sex from employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dept_emp.emp_no, last_name, first_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.emp_no IN ( 
	SELECT emp_no FROM dept_emp 
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE departments.dept_no = ( 
		SELECT dept_no FROM departments WHERE dept_name = 'Sales'
		)
	)	


--7. List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name IN (
	SELECT dept_name FROM departments
	WHERE dept_name = 'Sales' OR dept_name = 'Development'
	)


--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, count(last_name) as last_name_counts
FROM employees 
GROUP BY last_name
ORDER BY last_name_counts DESC;
