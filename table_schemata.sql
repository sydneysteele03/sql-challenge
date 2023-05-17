--create and import the tables from CSV files in starter code 
--employees.csv
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INT, 
	emp_title_id VARCHAR REFERENCES titles(title_id),
	birth_date VARCHAR, 
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR,
	hire_date VARCHAR,
	PRIMARY KEY(emp_no)
);

--dept_imp.csv
CREATE TABLE dept_emp (
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--dept_manager
CREATE TABLE dept_manager (
	dept_no VARCHAR REFERENCES departments(dept_no),
	emp_no INT REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
)
;
--salaries
CREATE TABLE salaries (
	emp_no INT references employees(emp_no),
	salary INT,
	PRIMARY KEY (emp_no)
);

--display the data to ensure it was created correctly 
SELECT * FROM salaries;