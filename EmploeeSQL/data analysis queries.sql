-- Employee details and salary
SELECT emp.emp_no AS "Employee Number"
	,last_name AS "Last Name"
	,first_name AS "First Name"
	,sex AS "Sex"
	,sal.salary AS "Salary"
FROM employee AS emp
INNER JOIN employee_salary AS sal ON emp.emp_no = sal.emp_no;

-- Getting employee hired in year of 1986
SELECT first_name AS "First Name"
	,last_name AS "Last Name"
	,hire_date AS "Hire Date"
FROM employee AS emp
WHERE date_part('Year', hire_date) = 1986;

-- Getting list of department manager details
SELECT dept.dept_name AS "Department"
	,dept.dept_no AS "Department Number"
	,emp.emp_no AS "Employee Number"
	,emp.last_name AS "Last Name"
	,emp.first_name AS "First Name"
FROM employee emp
INNER JOIN department_manager dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN department dept ON dept_emp.dept_no = dept.dept_no;

-- Getting list of employee and department details
SELECT dept.dept_name AS "Department"
	,dept.dept_no AS "Department Number"
	,emp.emp_no AS "Employee Number"
	,emp.last_name AS "Last Name"
	,emp.first_name AS "First Name"
FROM employee emp
INNER JOIN department_employee dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN department dept ON dept_emp.dept_no = dept.dept_no;

-- Getting the employee whose first name is Hercules and last name begins with B
SELECT first_name AS "First Name"
	,last_name AS "Last Name"
	,sex AS "Sex"
FROM employee
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- Get all sales department employees
SELECT emp.emp_no AS "Employee Number"
	,last_name AS "Last Name"
	,first_name AS "First Name"
FROM employee emp
INNER JOIN department_employee dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN department dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';

-- Get all sales and development department employees
SELECT emp.emp_no AS "Employee Number"
	,last_name AS "Last Name"
	,first_name AS "First Name"
	,dept.dept_name AS "Department"
FROM employee emp
INNER JOIN department_employee dept_emp ON emp.emp_no = dept_emp.emp_no
INNER JOIN department dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name IN ('Sales', 'Development');

-- Frequency count of common last name of all employees
SELECT last_name AS "Last Name"
	,COUNT(*) AS "Count"
FROM employee
GROUP BY last_name
ORDER BY 2 DESC;




