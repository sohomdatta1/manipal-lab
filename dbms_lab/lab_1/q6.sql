-- Question 6: Assign the salary for all employees.
UPDATE EMPLOYEE SET salary = 10000 WHERE emp_no = 1;
UPDATE EMPLOYEE SET salary = 9000 WHERE emp_no = 2;
UPDATE EMPLOYEE SET salary = 8000 WHERE emp_no = 3;
UPDATE EMPLOYEE SET salary = 7000 WHERE emp_no = 4;
UPDATE EMPLOYEE SET salary = 6000 WHERE emp_no = 5;
-- OR to batch update
UPDATE EMPLOYEE SET salary = 10000;
