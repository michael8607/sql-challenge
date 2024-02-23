-- 1. 
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

-- 2. 

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3.
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    Departments.dept_no,
    Departments.dept_name,
    Employees.emp_no,
    Employees.last_name,
    Employees.first_name
FROM
    departments
INNER JOIN
    dept_manager ON Departments.dept_no = dept_manager.dept_no
INNER JOIN
    employees ON dept_manager.emp_no = employees.emp_no;

--4.
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    departments.dept_no,
    departments.dept_name
FROM
    employees
INNER JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN
    departments ON dept_emp.dept_no = departments.dept_no;
--5.
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--6.
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


--8.
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC, last_name;





