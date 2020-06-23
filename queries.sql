--1.- List the following details of each employee: employee number, 
--last name, first name, sex, and salary.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary 
FROM employees e
	INNER JOIN salaries s
	on e.emp_no = s.emp_no;

--2.- List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(ISOYEAR FROM hire_date) = 1986;

--3.- List the manager of each department with the following information: 
--department number,department name, the manager’s employee number, last name, 
--first name.

SELECT m.dept_no,d.depto_name,m.emp_no,e.last_name,e.first_name
FROM dept_manager m
	INNER JOIN departments d
	ON m.dept_no = d.depto_no
	INNER JOIN employees e
	ON m.emp_no = e.emp_no;

--4.- List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,d.depto_name
FROM dept_emp de
	INNER JOIN departments d
	ON de.dept_no = d.depto_no
	INNER JOIN employees e
	ON de.emp_no = e.emp_no;
	
--5.- List first name, last name, and sex for employees whose first name is
--“Hercules” and last names begin with “B.”

SELECT first_name,last_name,sex
FROM employees 
	WHERE first_name = 'Hercules' and LEFT(last_name,1)='B';
	
--6.- List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT de.emp_no,e.last_name,e.first_name,d.depto_name
FROM dept_emp de 
	INNER JOIN departments d
	ON de.dept_no = d.depto_no
	INNER JOIN employees e
	ON de.emp_no = e.emp_no
WHERE d.depto_name = 'Sales';

--7.- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name

SELECT de.emp_no,e.last_name,e.first_name,d.depto_name
FROM dept_emp de 
	INNER JOIN departments d
	ON de.dept_no = d.depto_no
	INNER JOIN employees e
	ON de.emp_no = e.emp_no
WHERE d.depto_name = 'Sales' OR d.depto_name = 'Development';

--8.- In descending order, list the frequency count of employee
--last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS frequency 
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;



