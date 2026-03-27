SELECT managers.manager_name , 
count(DISTINCT managers.emp_id) as direct_reportees
FROM employees
JOIN employees AS managers
ON employees.manager_id = managers.emp_id
JOIN employees AS senior_managers
on managers.manager_id = senior_managers.emp_id
group by managers.manager_name
order by direct_reportees desc

