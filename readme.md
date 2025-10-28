
# SQL Concepts Detailed Notes

This document consolidates and explains the key SQL concepts demonstrated in the uploaded scripts,
including **JOINS, OUTER JOINS, SELF JOINS, UNIONS, GROUP BY, HAVING, ORDER BY, LIMIT, and FILTER**.

---

## 1. JOINS

### Definition
`JOIN` is used to combine data from **two or more tables** based on a related column between them.

### Types of Joins
#### a. INNER JOIN
Returns only the rows that have matching values in both tables.

```sql
SELECT *
FROM employee_demographics AS DEM
INNER JOIN employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id;
```

#### b. LEFT JOIN
Returns all rows from the **left** table, and the matched rows from the right table.
Unmatched rows from the right table will appear as `NULL`.

```sql
SELECT *
FROM employee_demographics AS DEM
LEFT JOIN employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id;
```

#### c. RIGHT JOIN
Returns all rows from the **right** table, and the matched rows from the left table.
Unmatched left-side rows appear as `NULL`.

```sql
SELECT *
FROM employee_demographics AS DEM
RIGHT JOIN employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id;
```

#### d. FULL OUTER JOIN (conceptual)
Combines the results of both LEFT and RIGHT joins.
Not supported in all databases (e.g., MySQL before 8.0).

```sql
SELECT *
FROM employee_demographics AS DEM
FULL OUTER JOIN employee_salary AS SAL
ON DEM.employee_id = SAL.employee_id;
```

#### e. SELF JOIN
Used to join a table with itself to compare rows in the same table.

```sql
SELECT 
  EMP1.employee_id AS EmployeeID,
  EMP1.first_name AS EmployeeName,
  EMP2.employee_id AS ManagerID,
  EMP2.first_name AS ManagerName
FROM employee_demographics AS EMP1
JOIN employee_demographics AS EMP2
ON EMP1.employee_id + 1 = EMP2.employee_id;
```

---

## 2. UNION

### Definition
`UNION` combines the results of two or more `SELECT` statements **row-wise** (vertically).

- `JOIN` → combines **columns**
- `UNION` → combines **rows**

### Syntax
```sql
SELECT column_list FROM table1
UNION
SELECT column_list FROM table2;
```

### Key Points
- The number and order of columns must be the same in both queries.
- `UNION` removes duplicates by default.
- Use `UNION ALL` to include duplicates.

```sql
-- Removes duplicates
SELECT first_name, last_name FROM employee_demographics
UNION
SELECT first_name, last_name FROM employee_salary;

-- Includes duplicates
SELECT first_name, last_name FROM employee_demographics
UNION ALL
SELECT first_name, last_name FROM employee_salary;
```

### Example (Labeling)
```sql
SELECT first_name, last_name, 'OLD MAN' AS Label
FROM employee_demographics
WHERE age > 50 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'OLD WOMAN' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'HIGHPAID EMPLOYEE' AS Label
FROM employee_salary
WHERE salary > 70000;
```

---

## 3. GROUP BY

### Definition
`GROUP BY` groups rows with the same values in specified columns into summary rows.

### Example
```sql
SELECT gender, COUNT(*) AS TotalEmployees
FROM employee_demographics
GROUP BY gender;
```

---

## 4. HAVING

### Definition
`HAVING` is used to filter aggregated results (similar to `WHERE`, but for grouped data).

### Example
```sql
SELECT gender, AVG(age) AS AverageAge
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 35;
```

---

## 5. ORDER BY

### Definition
`ORDER BY` sorts the result set by one or more columns.

### Example
```sql
SELECT * FROM employee_salary
ORDER BY salary DESC, first_name ASC;
```

- `ASC` → ascending (default)
- `DESC` → descending

---

## 6. LIMIT

### Definition
`LIMIT` restricts the number of rows returned.

### Example
```sql
SELECT * FROM employee_salary
ORDER BY salary DESC
LIMIT 5;
```

This returns the **top 5 highest-paid employees**.

---

## 7. FILTER (WHERE Clause)

### Definition
`WHERE` is used to filter rows before grouping or aggregation.

### Example
```sql
SELECT * FROM employee_demographics
WHERE gender = 'Female' AND age > 30;
```

---

## 8. MULTIPLE JOINS EXAMPLE

```sql
SELECT DEM.first_name, DEM.last_name, SAL.salary, DEP.department_name
FROM employee_demographics AS DEM
JOIN employee_salary AS SAL
  ON DEM.employee_id = SAL.employee_id
JOIN department AS DEP
  ON SAL.department_id = DEP.department_id;
```

---

## 9. Practical Notes

- **`JOIN`** → horizontal combination (columns)
- **`UNION`** → vertical combination (rows)
- **`WHERE`** → filters individual rows
- **`HAVING`** → filters grouped rows
- **`ORDER BY`** → sorts the result set
- **`LIMIT`** → controls how many rows are shown

---

> 📘 These examples are drawn directly from the uploaded `.sql` scripts and organized for clarity.
