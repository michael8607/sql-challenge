DROP TABLE TITLES;

DROP TABLE EMPLOYEES
;
DROP TABLE SALARIES
DROP TABLE DEPT_MANAGER
DROP TABLE DEPT_EMP
DROP TABLE DEPARTMENTS
;

--table schema
-- create title table
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
	
--check columns
SELECT * FROM titles

--create employees table
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
	
--check columns
SELECT * FROM employees

--create table salaries
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary DECIMAL NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

--check columns
SELECT * FROM salaries

--create departments table
CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);


--check columns
SELECT * FROM departments

--create dept_emp table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--check columns
SELECT * FROM dept_emp

--create table dept_manager
--primary key is combo of both columns
CREATE TABLE dept_manager(
	dept_no VARCHAR,
		emp_no INT NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--check columns
SELECT * FROM dept_manager


