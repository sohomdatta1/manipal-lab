-- Question 1: Create a table employee with ( emp_no, emp_name, emp_address)
CREATE TABLE EMPLOYEE(emp_no number(10) NOT NULL, emp_name varchar2(20) NOT NULL, emp_address varchar2(20));
-- Question 2: Insert five employees information.
INSERT INTO EMPLOYEE VALUES (1,'JOHN DOE', 'MUMBAI');
INSERT INTO EMPLOYEE VALUES (2, 'TERENCE AUSTIN', 'MANIPAL');
INSERT INTO EMPLOYEE VALUES (3, 'BARCLAY COOPER', 'DELHI');
INSERT INTO EMPLOYEE VALUES (4, 'KEN APPLE', 'MANIPAL');
INSERT INTO EMPLOYEE VALUES (5, 'THORA DIXON', 'MANGALORE');
-- Question 3: Display names of all employees.
SELECT emp_name FROM EMPLOYEE;
-- Question 4: Display all the employees from ‘MANIPAL’.
SELECT * FROM EMPLOYEE WHERE emp_address LIKE '%MANIPAL%';
-- Question 5: Add a column named salary to employee table.
ALTER TABLE EMPLOYEE ADD salary number(5);
-- Question 6: Assign the salary for all employees.
UPDATE EMPLOYEE SET salary = 10000 WHERE emp_no = 1;
UPDATE EMPLOYEE SET salary = 9000 WHERE emp_no = 2;
UPDATE EMPLOYEE SET salary = 8000 WHERE emp_no = 3;
UPDATE EMPLOYEE SET salary = 7000 WHERE emp_no = 4;
UPDATE EMPLOYEE SET salary = 6000 WHERE emp_no = 5;
-- OR to batch update
UPDATE EMPLOYEE SET salary = 10000;
-- Queston 7: View the structure of the table employee using describe.
DESCRIBE EMPLOYEE;
-- Question 8: Delete all the employees from ‘MANGALORE’
DELETE FROM EMPLOYEE WHERE emp_address='MANGALORE';
-- Question 9: Rename employee as employee1.
RENAME EMPLOYEE TO EMPLOYEE1;
-- Question 10: Drop the table employee1.
DROP TABLE EMPLOYEE1;
