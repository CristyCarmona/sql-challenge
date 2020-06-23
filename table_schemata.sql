-- CREATE TABLES 
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20) NOT NULL);

SELECT * FROM titles; 

CREATE TABLE departments (
	depto_no VARCHAR(4) PRIMARY KEY,
	depto_name VARCHAR(20) NOT NULL);

SELECT * FROM departments; 

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5), 
	birth_date DATE, 
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id))

SELECT * FROM employees; 

CREATE TABLE dept_emp (
	dept_emp_id SERIAL PRIMARY KEY,
	emp_no INT NOT NULL, 
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(depto_no));
	
SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
	dept_manager_id SERIAL PRIMARY KEY,
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(depto_no));

SELECT * FROM dept_manager;

CREATE TABLE salaries (
	salaries_id SERIAL PRIMARY KEY,
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

SELECT * FROM salaries;
