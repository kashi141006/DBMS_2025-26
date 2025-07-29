CREATE DATABASE CSE_3A_120 
DROP DATABASE CSE_3A_120 
USE CSE_3A_120
--SYNTAX TO CREATE TABLE -- CREATE TABLE TABLENAME --(COL1 
--DATATYPE, --COL2 DATATYPE); 
DROP TABLE STUDENT ;
CREATE TABLE STUDENT 
( 
ROLLNO INT, 
NAME VARCHAR(20) 
); 
SELECT * FROM STUDENT
------------------HOW TO INSERT THE DATA?-------------------- --METHOD1: WITH COLUMN NAME 
INSERT INTO STUDENT (ROLLNO,NAME) VALUES (1,'RAM'); 
INSERT INTO STUDENT(NAME,ROLLNO) VALUES ('SHIVAM',2); 
INSERT INTO STUDENT(NAME,ROLLNO) VALUES (3,'XYZ'); 
INSERT INTO STUDENT (NAME) VALUES('MITALI'); 
SELECT * FROM STUDENT
--METHOD2: WITHOUT COLUMN NAME --If you're inserting values for all columns in order, you can skip column names 
INSERT INTO STUDENT VALUES (3,'KIRTI'); 
--ERROR 
INSERT INTO STUDENT VALUES ('SHYAM',4) 
--METHOD:3 INSERT MULTIPLE RECORD --batch inserts 
INSERT INTO STUDENT VALUES (5,'MAYA'),(6,'RESHMA'),(7,'MAYUR'); 
    --INSERT WITH NULL VALUE 

INSERT INTO STUDENT (NAME) VALUES('MITAL'); 
INSERT INTO STUDENT VALUES(8,NULL); 
INSERT INTO STUDENT VALUES(NULL,NULL); 
INSERT INTO STUDENT VALUES(9,'AMIT') 
---------------HOW TO FETCH INSERTED DATA?------------- --FATCH ALL THE INSERTED RECORDS 
SELECT * FROM STUDENT 
--SELECT SPECIFIC col 
SELECT ROLLNO  
FROM STUDENT 
SELECT NAME  
FROM STUDENT 
SELECT ROLLNO,NAME  
FROM STUDENT 
-------------------SELECT WITH CONDITION-------------------------- 
SELECT ROLLNO, NAME  
FROM STUDENT 
WHERE ROLLNO>5 
SELECT *  
FROM STUDENT 
WHERE NAME='RESHMA' 
SELECT ROLLNO, NAME  
FROM STUDENT 
WHERE ROLLNO=5; 
--------------------SELECT WITH NULL---------------------- --WRONG WAY --IT WILL NOT RETURN ANY RECORD 
SELECT * FROM  
STUDENT  
WHERE NAME = NULL
--NULL is not a value.  
 
 
  --it cannot be evaluated with the equality (=) operator.  -- it should be checked explicitly with the IS operator  
SELECT * FROM  
STUDENT  
WHERE NAME IS NULL ----------------------SELECT TOP RECORDS----------------------- 
SELECT *  
FROM STUDENT 
SELECT TOP 3 *  
FROM STUDENT 
SELECT TOP 10 NAME  
FROM STUDENT 
--PERCENT 
SELECT TOP 10 PERCENT * 
FROM STUDENT 
--SQL Server rounds up, not down. So even though 11% of 10 rows is 1.1, it returns 2 rows
  
SELECT TOP 11 PERCENT * 
FROM STUDENT
----------------------------SELECT UNIQUE RECORD---------------------------- 
SELECT NAME  
FROM STUDENT;

SELECT DISTINCT NAME  
FROM STUDENT
--BY DEFAULT DISTINCT DISPLAY THE RESULT IN ASCENDING ORDER 
SELECT DISTINCT ROLLNO,NAME 
FROM STUDENT 
INSERT INTO STUDENT VALUES(7,'MAYUR') 
INSERT INTO STUDENT VALUES(7,'KRISH') 
SELECT * 
FROM STUDENT 
---------------OPERATORS------------------ --1. AND --2. OR --3. IN / NOT IN --4. NOT --5. BETWEEN 
  ---AND--- 
SELECT *  
FROM STUDENT 
WHERE NAME='SHIVAM' AND ROLLNO=2 
SELECT *  
FROM STUDENT 
WHERE ROLLNO>2 AND ROLLNO<6 
---OR-- 
SELECT *  
FROM STUDENT 
WHERE  NAME='RAM' OR NAME='SHIVAM' 
SELECT *  
FROM STUDENT 
WHERE ROLLNO=3 OR ROLLNO=2 
SELECT *  
FROM STUDENT 
WHERE ROLLNO=1 OR ROLLNO=2 OR ROLLNO=3
-----IN/NOT IN------ 
SELECT *  
FROM STUDENT 
WHERE ROLLNO IN (1,2,3) 
SELECT *  
FROM STUDENT 
WHERE ROLLNO NOT IN (1,2,3) 
SELECT *  
FROM STUDENT 
WHERE NAME IN ('KIRTI','MAYA')
---NOT--- 
SELECT *  
FROM STUDENT  
WHERE NOT NAME='SHIVAM' 
SELECT *  
FROM STUDENT  
WHERE  NAME <> 'SHIVAM' 
SELECT *  
FROM STUDENT  
WHERE  NAME != 'SHIVAM' 
  
  --BETWEEN IS INCLUSIVE 
SELECT *  
FROM STUDENT  
WHERE ROLLNO BETWEEN 1 AND 5  
SELECT *  
FROM STUDENT  
WHERE ROLLNO BETWEEN 5 AND 10;
-- WRITE QUERY TO DISPLAY STUDENT WHOSE NAME IS EITHER 'RAM' OR 'SHYAM' AND ROLL NO 
--BETWEEN 1 TO 10 
SELECT * 
FROM STUDENT  
WHERE (NAME='RAM' OR NAME='SHYAM') AND (ROLLNO BETWEEN 1 AND 10)
---ODD/EVEN ROLL NO 
SELECT *  
FROM STUDENT 
WHERE ROLLNO%2=0 
SELECT *  
FROM STUDENT 
WHERE ROLLNO%2!=0 -
--RETRIVE WHOLE TABLE WITHOUT USING * -------- 
SELECT ROLLNO,NAME 
FROM STUDENT 
  
-- SELECT INTO, UPDATE, DELETE, ALTER, RENAME 
 --USE DBMS1_2025 
CREATE TABLE EMPLOYEE( 
Name VARCHAR(50),  
City VARCHAR(50), 
Age INT); 
DROP TABLE EMPLOYEE
INSERT INTO EMPLOYEE VALUES 
('Jay Patel','Rajkot',30), 
('Rahul Dave','Baroda',35), 
('Jeet Patel','Surat',31), 
('Vijay Raval','Rajkot',30); 
SELECT *  
FROM EMPLOYEE 
--Create table EMPLOYEE_DETAIL from Employee with all the columns and data.  
SELECT *  
INTO EMPLOYEE_DETAIL 
FROM EMPLOYEE ;
SELECT *  
FROM EMPLOYEE_DETAIL 
drop table EMPLOYEE_DETAIL
--Create table EMPLOYEE_DATA from Employee with first two columns with no data. 
SELECT NAME,CITY  
INTO EMPLOYEE_DATA 
FROM EMPLOYEE 
WHERE 1=0 
SELECT *  
FROM EMPLOYEE_DATA 
---------------------WITH DIFFERENT cONDITION---------------------------------- 
SELECT * INTO EMPLOYEE_DATA1 
FROM EMPLOYEE 
WHERE 2+2=5 
SELECT * FROM EMPLOYEE_DATA1 ----- 
SELECT * INTO EMPLOYEE_DATA2 
FROM EMPLOYEE 
WHERE 2+2=4 
SELECT * FROM EMPLOYEE_DATA2 ------- 
SELECT * INTO Employee_info 
FROM EMPLOYEE 
WHERE 'A'='B' 
SELECT * FROM Employee_info   
SELECT * INTO Employee_info1 
FROM EMPLOYEE 
WHERE 'ABC'='BCD' 
SELECT *  
FROM Employee_info1   
SELECT * INTO Employee_info2 
FROM EMPLOYEE 
WHERE 'A'='a' 
SELECT *  
FROM Employee_info3 
SELECT * INTO Employee_info3 
FROM EMPLOYEE 
WHERE 'AB'='ab'
------------------------INSERT ---------------- --Insert the Data into Employee_info from Employee Whose CITY is Rajkot 
SELECT * FROM Employee_info 
INSERT INTO Employee_info 
SELECT * FROM EMPLOYEE 
WHERE CITY='RAJKOT'; 
select * from Employee_info 
--Insert the Data into Employee_info from  --Employee Whose age is more than 32. 
INSERT INTO Employee_info  
SELECT * FROM EMPLOYEE 
WHERE Age>32;
---CREATE EMP AND INSERT DATA WHOSE AGE >30 from Employee 
SELECT * INTO EMP  
FROM EMPLOYEE 
WHERE AGE>30 
SELECT * FROM EMP --NOTE --Indexes, constraints, and triggers defined in the source table  --are not transferred to the new table using SELECT into statement. 
   ----------------------------UPDATE------------------ 
 --Update age of employee named 'Jay Patel' to 32 
 SELECT * FROM EMPLOYEE
UPDATE EMPLOYEE 
SET AGE=32 
WHERE NAME='Jay Patel'
--CHANGE CITY OF JAY PATEL TO MORBI 
UPDATE EMPLOYEE 
SET CITY='MORBI' 
WHERE NAME='JAY PATEL' 
SELECT * FROM EMPLOYEE -- Update age to 33 for all employees from 'Rajkot' 
UPDATE EMPLOYEE 
SET AGE=33 
WHERE CITY='RAJKOT' --CHAGE NAME JEET PATEL TO JEET 
UPDATE EMPLOYEE 
SET NAME='JEET' 
WHERE NAME='JEET PATEL' -- Update name to jeet p patel and age to 34 of employee from city 'Surat' 
UPDATE EMPLOYEE 
SET Name = 'Jeet P. Patel', Age = 34 
WHERE City = 'Surat'; --CHANGE NAME OF SURAT TO TEXTILE CITY 
UPDATE EMPLOYEE 
SET CITY='TEXTILE CITY' 
WHERE CITY='SURAT' 
SELECT * FROM EMPLOYEE 
  -- Increase age by 1 for employees in 'Rajkot' or 'Baroda' 
UPDATE EMPLOYEE 
SET Age=Age+1 
WHERE City IN ('Rajkot', 'Baroda'); -- Set city to 'Ahmedabad'    --where age is 34 and city is 'TEXTILE CITY' 
UPDATE EMPLOYEE 
SET City = 'Ahmedabad' 
WHERE Age = 34 AND City = 'TEXTILE CITY'; --SET AGE NULL 
UPDATE EMPLOYEE 
SET AGE=NULL 
WHERE NAME='JAY PATEL' 
--UPDATE SAME VALUE IN ALL RECORD 
UPDATE EMPLOYEE 
SET AGE=25 
SELECT * 
FROM EMPLOYEE 
------------------------DELETE------------------------ 
CREATE TABLE EMPLOYEE( 
Name VARCHAR(50),  
City VARCHAR(50), 
Age INT); 
DELETE from  
EMPLOYEE 
INSERT INTO EMPLOYEE VALUES 
('Jay Patel','Rajkot',30), 
('Rahul Dave','Baroda',35), 
('Jeet Patel','Surat',31), 
('Soham Raval','Valsad',30), 
('Meet Shah','Baroda',35), 
('Milan Patel','Vapi',31), 
('Kiran Manek','Ahmedabad',30), 
('Mitesh Patel','Kalol',NULL); --DELETE EMPLOYEE FROM RAJKOT 
DELETE FROM EMPLOYEE 
WHERE CITY='RAJKOT' 
select * from EMPLOYEE --REMOVE THE RECORD WHOSE AGE IS 30 
DELETE FROM EMPLOYEE  
WHERE AGE=30 
SELECT * FROM EMPLOYEE -
-----REMOVE RECORD WHOSE CITY IS BARODA AND AGE IS 35 
DELETE FROM EMPLOYEE 
WHERE CITY='BARODA' AND AGE=35 -
- ------------------DELETE WITH IN AND OR OPERATOR 
DELETE FROM EMPLOYEE 
WHERE CITY IN ('VAPI','AHMEDABAD') 
DELETE FROM EMPLOYEE 
WHERE CITY='VAPI'OR CITY='AHMEDABAD'
--DELETE where Age is NULL 
DELETE FROM EMPLOYEE 
WHERE AGE IS NULL --DELETE ALL RECORDS 
DELETE FROM 
EMPLOYEE 
select * from EMPLOYEE 
-----------ALTER------------------- --ALTER  is used to add, modify, or drop columns in a table 
SELECT * FROM EMPLOYEE 
DROP TABLE EMPLOYEE 
CREATE TABLE EMPLOYEE( 
Name VARCHAR(50),  
City VARCHAR(50), 
Age INT); 
INSERT INTO EMPLOYEE VALUES 
('Jay Patel','Rajkot',30), 
('Rahul Dave','Baroda',35), 
('Jeet Patel','Surat',31), 
('Soham Raval','Valsad',30), 
('Meet Shah','Baroda',35), 
('Milan Patel','Vapi',31), 
('Kiran Manek','Ahmedabad',30), 
('Mitesh Patel','Kalol',NULL)
--ADD COLUMNS ---ADD COLUMN SALARY 
ALTER TABLE EMPLOYEE  
ADD SALARY DECIMAL(8,2); 
 
SELECT * FROM EMPLOYEE --ADD COLUMNS DEPARTMENT AND DESIGNATION 
select * 
from EMPLOYEE 
ALTER TABLE EMPLOYEE 
ADD DEPARTMENT VARCHAR(20),DESIGNATION VARCHAR(20) --ADD COLUMN MOBILE AND ADDRESS 
ALTER TABLE EMPLOYEE 
ADD MOBILE VARCHAR(20), ADDRESS VARCHAR(50) 
SELECT * FROM EMPLOYEE ----------- 
update employee  
set salary=123.45  
where age>=30 ---- DROP COLUMN 
ALTER TABLE EMPLOYEE 
DROP COLUMN MOBILE 
SELECT * FROM EMPLOYEE --DROP MULTIPLE COULMNS 
ALTER TABLE EMPLOYEE 
DROP COLUMN DESIGNATION,ADDRESS 
select *  
from employee ---------MODIFY COLUMN 
ALTER TABLE EMPLOYEE 
ALTER COLUMN CITY CHAR(30) 
ALTER TABLE EMPLOYEE 
ALTER COLUMN NAME CHAR(20) 
select *  
from EMPLOYEE 
ALTER TABLE EMPLOYEE 
ALTER COLUMN AGE DECIMAL(5,2) 
SELECT * FROM EMPLOYEE 
  --LEAD TO DATA LOSS 
ALTER TABLE EMPLOYEE 
ALTER COLUMN SALARY INT --ERROR 
ALTER TABLE EMPLOYEE 
ALTER COLUMN CITY INT --CHANGE AGE TO VARCHAR (Will work, but Wrong Practice) 
ALTER TABLE EMPLOYEE 
ALTER COLUMN AGE VARCHAR(10) 
SELECT * FROM EMPLOYEE 
drop table EMPLOYEE ---IMPLICIT TYPE CASTING FROM VARCHAR DATA TYPE TO INT DONE BY SQL SERVER 
UPDATE EMPLOYEE 
SET AGE=AGE+5 
WHERE NAME='jeet patel' 
INSERT INTO EMPLOYEE VALUES ('SOHAM','RAJKOT','A') 
SELECT * FROM 
EMPLOYEE 
UPDATE EMPLOYEE 
SET AGE=AGE+5 
WHERE NAME='SOHAM' --ADD MOBILE COLUMN 
ALTER TABLE EMPLOYEE 
ADD MOBILE decimal(8,2) 
SELECT * FROM EMPLOYEE 
SP_HELP EMPLOYEE -----------------RENAME------------ --sp_rename system stored procedure lets you rename  --various database objects—including tables, columns 
SELECT *  
FROM EMPLOYEE --RENAME COLUMN MOBILE TO CONTACTNO 
Page 7 of 9 
Computer Science & Engineering 
A.Y. 2025 | Semester - 3 
SQL   
Database Management System - I 
SP_RENAME 'EMPLOYEE.MOBILE','CONTACTNO' --WHY WARNING???????????? --When you rename a table, column, or any object,  --SQL Server doesn’t update references inside  --stored procedures, views, scripts, functions, triggers, or other modules  --That message is Microsoft’s way of reminding you to check and fix dependent code 
manually. --RENAME TABLE NAME 
SP_RENAME 'EMPLOYEE','EMPLOYEE_MASTER' --CHANGE THE NAME EMPLOYEE_MASTER TO EMP_INFO 
SP_RENAME 'EMPLOYEE_MASTER','EMP_INFO' 
SELECT * FROM EMP_INFO -------TRUNCATE----------- --TRUNCATE deletes all rows in one go, not one by one row  
TRUNCATE TABLE EMP_INFO 
select * from emp_info --DROP 
DROP TABLE EMP_INFO 
DROP DATABASE DEMO 
DROP TABLE EMPLOYEE ------------------------------ 
CREATE TABLE EMPLOYEE( 
Name VARCHAR(50),  
City VARCHAR(50), 
Age INT); 
INSERT INTO EMPLOYEE VALUES 
('Jay Patel','Rajkot',30), 
('Rahul Dave','Baroda',35), 
('Jeet Patel','Surat',31), 
('Soham Raval','Valsad',30), 
('Meet Shah','Baroda',35), 
('Milan Patel','Vapi',31), 
('Kiran Manek','Ahmedabad',30), 
('Mitesh Patel','Kalol',NULL); 
Page 8 of 9 
Computer Science & Engineering 
A.Y. 2025 | Semester - 3 
SQL   
Database Management System - I --DIFFERANCE--- 
select * from employee --DELETE WITH CONDITION 
DELETE FROM  
EMPLOYEE 
WHERE CITY='RAJKOT' 
SELECT * FROM EMPLOYEE ---DELETE ALL RECORDS 
delete from EMPLOYEE ---DELETE ALL RECORDS USING TRUNCATE 
TRUNCATE TABLE 
EMPLOYEE 
SELECT * 
FROM EMPLOYEE --STRUCTURE OF TABLE IS STILL EXIST --DROP 
DROP TABLE EMPLOYEE 
 