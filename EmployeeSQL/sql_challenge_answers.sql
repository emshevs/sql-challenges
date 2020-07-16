CREATE TABLE employees (emp_no INT NOT NULL, 
					   emp_title VARCHAR(30),
					   birth_date date,
						first_name VARCHAR(30),
						last_name VARCHAR(30), 
						sex VARCHAR(30),
						hire_date date, 
						PRIMARY KEY (emp_no));
						
CREATE TABLE salaries (emp_no INT NOT NULL,
					  salary int)

CREATE TABLE titles (title_id VARCHAR(30),
					title VARCHAR(30));
					
CREATE TABLE departments (dept_no VARCHAR (30),
						 dept_name VARCHAR(30),
						 PRIMARY KEY (dept_no));

CREATE TABLE dept_manager (dept_no VARCHAR(30), 
						  emp_no INT);
						  
CREATE TABLE dept_emp (emp_no INT, dept_no VARCHAR(30));

--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT * from employees

CREATE VIEW question1 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW question2 AS 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
CREATE VIEW question3 AS 
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
CREATE VIEW question4 AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

--List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."
CREATE VIEW question5 AS 
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'AND last_name LIKE'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
CREATE VIEW question6 AS 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
CREATE VIEW question7 AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name
CREATE VIEW question8 AS 
SELECT last_name, COUNT(last_name) AS "Frequency of last name"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of last name" DESC



