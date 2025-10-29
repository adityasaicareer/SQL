-- stored procedures

-- stored procedures were used to save the SQL code and reuse them over and over again

-- store the complex query and increase the efficiency

select * from employee_salary where salary>=50000;


CREATE PROCEDURE large_salaries()
select * from employee_salary where salary>=50000;
 
 
CALL large_salaries();



-- STRORING MULTIPLE SQL EXPRESSIOPNS

-- FOR THAT WE NEED TO DEFINE DELIMITER $$

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
    FROM EMPLOYEE_SALARY
    WHERE SALARY>50000;
    SELECT *
    FROM EMPLOYEE_SALARY
    WHERE SALARY>10000;
END $$

DELIMITER %;

CALL large_salaries2();

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
    FROM EMPLOYEE_SALARY
    WHERE SALARY>50000;
    SELECT *
    FROM EMPLOYEE_SALARY
    WHERE SALARY>10000;
END $$

DELIMITER ;

CALL large_salaries3();

call new_procedure();

-- Parameters

-- parameters were the variables to take the input from the sql code

DELIMITER $$
CREATE PROCEDURE large_salary4(EMP_ID INT)
BEGIN
	SELECT SALARY,employee_id 
    FROM EMPLOYEE_SALARY
    WHERE EMPLOYEE_ID=EMP_ID;
END$$

DELIMITER ;

CALL large_salary4(3);




