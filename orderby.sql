SELECT * FROM employee_demographics
ORDER BY FIRST_NAME;

-- ORDER BY WAS ASCENDING BY DEFAULT 
-- WE HAE TO SPECIFY FOR THE DESCENDING ORDER

SELECT * FROM EMPLOYEE_DEMOGRAPHICS 
ORDER BY FIRST_NAME DESC;

SELECT * FROM
employee_demographics
ORDER BY GENDER,AGE DESC;

-- in orderby the ordering was made which ever column name comes first
-- we can also specify th eposition of the column namw rather than the name

select * from 
employee_demographics
order by 5,4;
-- the above was not a base practice as some columns might be added and some might be deleted