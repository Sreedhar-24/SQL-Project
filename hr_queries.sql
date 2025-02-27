-- SELECT THE HR DATABASE
USE hr;

-- Q1. Retrive all the details of employees.
SELECT * FROM employees;

-- Q2 Display the first name, last name, and email of all employees. 
SELECT first_name,last_name,email FROM employees;

-- Q3 Retrieve the distinct job titles from the jobs table. 
SELECT DISTINCT job_id FROM employees;

-- Q4 Find the total number of employees in the company.
SELECT COUNT(*) FROM employees;

-- Q5 Retrieve the employees who were hired after January 1, 2015.
SELECT * FROM employees WHERE hire_date>"2015-01-01"; 

-- Q6 List all employees who have a salary greater than 5000. 
SELECT * FROM employees WHERE salary>5000;

-- Q7 Retrieve employees with job titles containing the word ‘Manager.’ 
SELECT e.* FROM employees e JOIN jobs ON jobs.job_id=e.job_id WHERE jobs.job_title LIKE "%Manager%";

-- Q8  Retrieve all employees whose first name starts with ‘A’ and ends with ‘n’. 
SELECT * FROM employees WHERE first_name LIKE "A%n";

-- Q9. Display the employees who do not have a commission. 
SELECT * FROM employees WHERE commission_pct=0.0;

-- Q10. Retrieve the top 5 highest-paid employees. 
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Q11. Find the average salary of all employees. 
SELECT AVG(salary) average_salary FROM employees;

-- Q12. Retrieve the total number of employees working in each department. 
SELECT COUNT(*) FROM employees GROUP BY department_id;

-- Q13. Display the employee's first name and the length of their first name.
SELECT first_name ,LENGTH(first_name) fname_length FROM employees;
 
-- Q14. Convert the hire_date of employees to display only the year. 
SELECT YEAR(hire_date) hiring_year FROM employees;

-- Q15. Retrieve the minimum and maximum salary for each job title. 
SELECT job_id, MIN(salary) mininum_salary, MAX(salary) maximum_salary FROM employees GROUP BY job_id;

-- Q16. Retrieve the employee names along with their department names. 
SELECT CONCAT(e.first_name," ",e.last_name) emp_name, d.department_name FROM employees e JOIN departments d  ON d.department_id=e.department_id;

-- Q17. List the employees along with their job titles and the location of their department. 
SELECT e.*, j.job_title,CONCAT(l.street_address,", ",l.city,", ",l.state_province,", ",c.country_name," ",l.postal_code) department_address FROM employees e JOIN jobs j ON j.job_id=e.job_id JOIN departments d ON d.department_id=e.department_id JOIN locations l ON l.location_id=d.location_id JOIN countries c ON c.country_id=l.country_id;

-- Q18. Retrieve the department names along with the count of employees in each department. 
SELECT d.department_name, COUNT(*) number_Of_emp FROM employees e JOIN departments d ON d.department_id=e.department_id GROUP BY e.department_id;

-- Q19. Find employees who have the same job as their manager. 
SELECT * FROM employees WHERE employee_id IN (SELECT manager_id FROM employees);

-- Q20. Display the names of employees who worked in different jobs in the past (use job_history). 
SELECT * FROM employees e JOIN job_history jh ON jh.employee_id=e.employee_id;