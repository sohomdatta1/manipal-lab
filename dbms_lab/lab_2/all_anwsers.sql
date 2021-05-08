-- Q1) Create EMPLOYEE table with following constraints:
--       i) Make EmpNo as Primary key.
--      ii) Do not allow EmpName, Gender, Salary and Address to have null values.
--     iii) Allow Gender to have one of the two values: ‘M’, ‘F’.
CREATE TABLE EMPLOYEE(
  EmpNo number(5) NOT NULL,
  EmpName varchar2(20) NOT NULL,
  Gender varchar2(1) NOT NULL,
  Salary number(5) NOT NULL,
  Address varchar2(20) NOT NULL,
  DNo number(5) NOT NULL,
  primary key (EmpNo),
  CHECK (Gender in ('M','F'))
);
-- Q2)
CREATE TABLE DEPARTMENT(
  DeptNo number(5),
  DeptName varchar2(20) UNIQUE,
  Location varchar2(20),
  primary key (DeptNo)
);
-- Q3)
ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_Dno foreign key(DNo) references DEPARTMENT(DeptNo);
-- Q4)
INSERT INTO DEPARTMENT VALUES(1,'COMPUTER WIZ', 'AB5');
INSERT INTO DEPARTMENT VALUES(2, 'WE ARE DE ADMINZ', 'AB1');
INSERT INTO EMPLOYEE VALUES(1, 'ANTHONY APPLE', 'M', 10000, 'HYDERABAD',1);
INSERT INTO EMPLOYEE VALUES(2, 'IMANE POTTER', 'F', 10000, 'MUMBAI',1);
INSERT INTO EMPLOYEE VALUES(3, 'HARRY SWANSON', 'M', 10000, 'KOLKATA',2);
INSERT INTO EMPLOYEE VALUES(4, 'THOMSON JENNINGS', 'M', 10000, 'DELHI',2);
-- Q5)
INSERT INTO EMPLOYEE VALUES(5, 'IMMA BYTHEWAY','T',10000, 'HOWRAH');
INSERT INTO DEPARTMENT VALUES (2, 'STUDENT COUNCIL', 'AB1');
-- Q6)
DELETE FROM DEPARTMENT WHERE DeptNo = 2;
-- Q7)
ALTER TABLE EMPLOYEE DROP CONSTRAINT fk_Dno;
ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_Dno foreign key(DNo) references DEPARTMENT(DeptNo) ON DELETE CASCADE;
-- Q8)
ALTER TABLE EMPLOYEE MODIFY Salary DEFAULT 10000;
--------------------------------------------------------
-- Note to self: This above question is kinda wrong...
-- Default is associated with columns and there
-- doesn't seem to be a way to make it into a named constraint...
-- for defining named constraints refer to Q3
--------------------------------------------------------
-- University database schema start
-- Student (ID, name,dept-name, tot-cred);
-- Instructor(ID, name, dept-name, salary);
-- Course (Course-id, title,dept-name, credits);
-- Takes (ID, course-id, sec-id, semester, year, grade);
-- Classroom (building, room-number, capacity);
-- Department (dept-name, building, budget);
-- Section (course-id, section-id, semester, year, building, room-number, time-slot-id);
-- Teaches (id, course-id, section-id, semester, year);
-- Advisor(s-id, i-id);
-- Time-slot (time-slot-id, day, start-time, end-time);
-- Prereq (course-id, prereq-id);
-- University database schema end
-- Q9)
SELECT name, dept_name FROM student;
-- Q10)
SELECT * FROM instructor;
-- Q11)
SELECT title FROM Course WHERE credits = 3;
-- Q12)
SELECT course_id, title FROM Takes NATURAL JOIN Course WHERE ID = 12345;
-- Q13)
SELECT * FROM Instructor WHERE salary BETWEEN 40000 AND 90000;
-- Q14)
SELECT * FROM Instructor WHERE ID NOT IN (SELECT DISTINCT id FROM Teaches);
-- Q15)
Select name, title, takes.year FROM student, section, course, takes WHERE room_number=3128 and course.course_id = section.course_id and course.course_id = takes.course_id and takes.id = student.id and takes.year = section.year and takes.sec_id = section.sec_id and section.semester = takes.semester and classroom.room_number='303';
----------------------------------------------
-- NOTE: Not really sure
----------------------------------------------
-- Q16)
SELECT name,course_id,title AS c_name FROM (((student NATURAL JOIN takes) NATURAL JOIN course) NATURAL JOIN student) where year=2010;
-- Q17)
SELECT name, salary FROM Instructor where salary > ANY(SELECT salary as inst_salary FROM Instructor WHERE dept_name='Comp. Sci.');
-- Q18)
SELECT name FROM Instructor WHERE dept_name LIKE '%ch%';
-- Q19)
SELECT name, LENGTH(name) FROM Student;
-- Q20)
SELECT dept_name, SUBSTR(dept_name, 3, 3) FROM Department;
-- Q21)
SELECT UPPER(name) FROM Instructor;
-- Q22)
SELECT NVL(tot_cred, 100) FROM Student;
-- Q23)
SELECT salary, ROUND(salary/3, -2) FROM Instructor;
-- Q24)
SELECT EMPNAME, to_char(DOB,'DD-MON-YYYY') FROM EMPLOYEE;
SELECT EMPNAME, to_char(DOB,'DD-MON-YY') FROM EMPLOYEE;
SELECT EMPNAME, to_char(DOB,'DD-MM-YY') FROM EMPLOYEE;
-- Q25)
SELECT EMPNAME, to_char(DOB) FROM EMPLOYEE;
-- Q26)
SELECT EMPNAME, to_char(DOB) FROM EMPLOYEE;
-- Q27)
SELECT EMPNAME, to_char(DOB) FROM EMPLOYEE;
-- Q28)
SELECT EMPNAME, LAST_DAY(DOB) FROM EMPLOYEE;
