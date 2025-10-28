-- Joins
-- joins were used to join two tables together

-- default it is innerjoin

SELECT * FROM EMPLOYEE_DEMOGRAPHICS;
SELECT * FROM EMPLOYEE_SALARY;

SELECT * FROM EMPLOYEE_DEMOGRAPHICS JOIN employee_salary;

SELECT DEM.EMPLOYEE_ID,DEM.FIRST_NAME,SAL.SALARY,AGE,OCCUPATION FROM employee_demographics AS DEM JOIN employee_salary AS SAL ON DEM.employee_id=SAL.employee_id;