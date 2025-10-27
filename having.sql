select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;

--  group by function whicj was used to get the occupation of more sal
SELECT OCCUPATION,AVG(SALARY) 
FROM EMPLOYEE_SALARY
WHERE OCCUMATION LIKE "%MANAGER%"
GROUP BY OCCUPATION
HAVING AVG(SALARY)>50000