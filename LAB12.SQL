--Create following table (Using Design Mode) 
--PERSON 
--Column_Name DataType Constraints  
--PersonID Int Primary Key 
--PersonName Varchar (100) Not Null 
--DepartmentID Int Foreign Key, Null 
--Salary Decimal (8,2) Not Null 
--JoiningDate Datetime Not Null 
--City Varchar (100) Not Null 
 
 
-- Computer Science & Engineering 
--A.Y. 2025 | Semester - III  
--Lab Manual  
--2301CS302 – Database Management System - I 
 
--Page 13 of 17 
--DEPT 
--Column_Name DataType Constraints  
--DepartmentID Int Primary Key 
--DepartmentName Varchar (100) Not Null, Unique 
--DepartmentCode Varchar (50) Not Null, Unique 
--Location Varchar (50) Not Null 
 
--PersonID PersonName DepartmentID Salary JoiningDate City 
--101 Rahul Tripathi 2 56000 01-01-2000 Rajkot 
--102 Hardik Pandya 3 18000 25-09-2001 Ahmedabad 
--103 Bhavin Kanani 4 25000 14-05-2000 Baroda 
--104 Bhoomi Vaishnav 1 39000 08-02-2005 Rajkot 
--105 Rohit Topiya 2 17000 23-07-2001 Jamnagar 
--106 Priya Menpara NULL 9000 18-10-2000 Ahmedabad 
--107 Neha Sharma 2 34000 25-12-2002 Rajkot 
--108 Nayan Goswami 3 25000 01-07-2001 Rajkot 
--109 Mehul Bhundiya 4 13500 09-01-2005 Baroda 
--110 Mohit Maru 5 14000 25-05-2000 Jamnagar 
 
--DepartmentID DepartmentName DepartmentCode Location 
--1 Admin Adm A-Block 
--2 Computer CE C-Block 
--3 Civil CI G-Block 
--4 Electrical EE E-Block 
--5 Mechanical ME B-Block 
--From the above given table perform the following queries: 
CREATE TABLE PERSON(
PERSONID INT PRIMARY KEY,
PERSONNAME VARCHAR(100) NOT NULL,
DEPARTMENTID INT  FOREIGN KEY REFERENCES DEPT(DEPARTMENTID)  NULL,
SALARY DECIMAL (8,2) NOT NULL ,
JOININGDATE DATETIME NOT NULL, 
CITY VARCHAR(100) NOT NULL 
);

INSERT INTO PERSON VALUES
(101,'RAHUL TRIPATHI',2,56000,'2000-1-1','RAJKOT'),
(102,'HARDIK PANDYA',3,18000,'2001-9-25','AHMEDABAD'),
(103,'BHAVIN KANANI',4,25000,'2000-5-14','BARODA'),
(104,'BHOOMI VAISHNAV',1,39000,'2005-2-5','RAJKOT'),
(105,'ROHIT TOPIYA',2,17000,'2001-7-23','JAMNAGAR'),
(106,'PRIYA MENPARA',NULL,9000,'2000-10-18','AHMEDABAD'),
(107,'NEHA SHARMA',2,34000,'2002-12-25','RAJKOT'),
(108,'NAYAN GOSWAMI',3,25000,'2001-7-1','RAJKOT'),
(109,'MEHUL BHUNDIYA',4,13000,'2005-1-9','BARODA'),
(111,'MOHIT MARU',5,14000,'2000-5-25','JAMNAGAR');

CREATE TABLE DEPT(
DEPARTMENTID INT PRIMARY KEY,
DEPARTMENTNAME VARCHAR(100) NOT NULL UNIQUE,
DEPARTMENTCODE VARCHAR(50) NOT NULL UNIQUE,
LOCATION  VARCHAR(50) NOT NULL
);
INSERT INTO DEPT VALUES
(1,'ADMIN','ADM','A-BLOCK'),
(2,'COMPUTER','CE','C-BLOCK'),
(3,'CIVIL','CI','G-BLOCK'),
(4,'ELECTRICAL','EE','E-BLOCK'),
(5,'MECHANICAL','ME','B-BLOCK');
--Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product.
SELECT *
FROM PERSON,DEPT;

--2. Find all persons with their department name 
SELECT 
	PERSONNAME ,
	DEPT.DEPARTMENTNAME
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--3. Find all persons with their department name & code. 
SELECT 
	PERSONNAME ,
	DEPT.DEPARTMENTNAME,
	DEPARTMENTCODE
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--4. Find all persons with their department code and location. 
SELECT 
	PERSONNAME ,
	DEPT.DEPARTMENTNAME,
	LOCATION,
	DEPT.DEPARTMENTCODE
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;
--5. Find the detail of the person who belongs to Mechanical department. 
SELECT 
	PERSONNAME,
	DEPT.DEPARTMENTNAME
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPARTMENTCODE='ME';

--6. Final person’s name, department code and salary who lives in Ahmedabad city. 
SELECT 
	PERSONNAME,
	DEPT.DEPARTMENTCODE,
	SALARY
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE CITY='AHMEDABAD';

--7. Find the person's name whose department is in C-Block.

SELECT 
	PERSONNAME,
	DEPT.DEPARTMENTNAME
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE LOCATION='C-BLOCK';
--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT PERSONNAME,DEPT.DEPARTMENTNAME,SALARY
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE CITY='JAMNAGAR';
--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
SELECT 
	PERSONNAME,
	DEPT.DEPARTMENTNAME,
	JOININGDATE
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPARTMENTNAME='CIVIL' AND JOININGDATE>'2001-8-1';
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT 
	PERSONNAME,
	DEPT.DEPARTMENTNAME,
	JOININGDATE,
	DATEDIFF(DAY,JOININGDATE,GETDATE()) AS_DIFF_DAYS
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
 WHERE DATEDIFF(DAY,JOININGDATE,GETDATE())>365
--11. Find department wise person counts. 
SELECT 
	DEPT.DEPARTMENTNAME,
	COUNT(PERSONID) AS COUNT_PERSON
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME;
 
--12. Give department wise maximum & minimum salary with department name. 
SELECT 
	DEPT.DEPARTMENTNAME,
	MAX(SALARY) AS MAX_SAL,
	MIN(SALARY) AS MIN_SAL
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME;

--13. Find city wise total, average, maximum and minimum salary. 
SELECT 
     CITY,
	 SUM(SALARY) AS TOATAL_SAL,
	 AVG(SALARY) AS AVG_SAL,
	  MAX(SALARY) AS MAX_SAL,
	  MIN(SALARY) AS MIN_SAL
FROM PERSON
 GROUP BY CITY;



--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT  PERSONNAME,
	AVG(SALARY) AS AVG_SAL
FROM PERSON
WHERE CITY='AHMEDABAD'
GROUP BY PERSONNAME
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
SELECT 
	CONCAT(PERSONNAME,'LIVES IN',CITY,'AND WORKS IN', DEPT.DEPARTMENTNAME,'DEPARTMENT') AS DETAILS 
FROM PERSON
JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--Part – B: 

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT 
	CONCAT(PERSONNAME,'EARNS',SALARY,'  FROM  ', DEPT.DEPARTMENTNAME,'DEPARTMENT MONTHLY') AS DETAILS 
FROM PERSON
JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--2. Find city & department wise total, average & maximum salaries.
SELECT
	CITY,
	DEPT.DEPARTMENTNAME,
	SUM(SALARY) AS TOTAL_SAL,
	AVG(SALARY) AS AVG_SAL,
	MAX(SALARY) AS MAX_SAL
FROM PERSON
INNER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY CITY,DEPT.DEPARTMENTNAME;

--3. Find all persons who do not belong to any department. 
SELECT
	PERSONNAME,
	DEPT.DEPARTMENTNAME
FROM PERSON
LEFT OUTER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTID IS NULL;

 --4. Find all departments whose total salary is exceeding 100000. 
  
SELECT
	DEPT.DEPARTMENTNAME,
	SUM(SALARY) AS TOATAL_SAL
FROM PERSON
LEFT OUTER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
 GROUP BY DEPT.DEPARTMENTNAME
 HAVING SUM(SALARY)>100000

--Part – C: 
--1. List all departments who have no person. 
SELECT
	PERSONNAME,
	DEPT.DEPARTMENTNAME
FROM PERSON
LEFT OUTER JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE PERSON.DEPARTMENTID IS NULL;

--2. List out department names in which more than two persons are working. 
SELECT
	DEPT.DEPARTMENTNAME
FROM PERSON
  JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME
HAVING COUNT(PERSONID)>2;

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)
 UPDATE PERSON
SET PERSON.SALARY = PERSON.SALARY * 1.10
 FROM PERSON
 INNER JOIN DEPT
 ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
 WHERE DEPT.DEPARTMENTNAME='COMPUTER';

