--Math functions 
--Part – A: 
--1. Display the result of 5 multiply by 30. 
SELECT 5*30 AS RESULT;

--2. Find out the absolute value of -25, 25, -50 and 50. 
SELECT ABS(-25),ABS(25),ABS(-50),ABS(50) 

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT 5%2 AS FIVE_TWO ,5%3 AS FIVE_THREE

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
SELECT POWER(3,2) ,POWER(4,3)

--7. Find out the square root of 25, 30 and 50. 
SELECT SQRT(25),SQRT(30),SQRT(50)
--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5),SQUARE(15),SQUARE(25)

--9. Find out the value of PI. 
SELECT PI() AS VAL_PI

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 
SELECT ROUND(157.732,2),
ROUND(157.732,0),
ROUND(157.732,-2);

--11. Find out exponential value of 2 and 3. 
SELECT LOG(2) AS EXP_2,
LOG(3) AS EXP_3;
--12. Find out logarithm having base e of 10 and 2. 
SELECT LOG(10) AS LN_10,
LOG(2) AS LN_2;

--13. Find out logarithm having base b having value 10 of 5 and 100. 
SELECT LOG10(5) AS LN_5,
LOG10(100) AS LN_100;
--14. Find sine, cosine and tangent of 3.1415. 
SELECT SIN(3.1415) AS SINE,
COS(3.1415) AS COSINE,
TAN(3.1415) AS TANGENT

--15. Find sign of -25, 0 and 25. 
SELECT SIGN(-25),SIGN(0),SIGN(25)

--16. Generate random number using function.
SELECT RAND() AS RANDOM_NUM

--Part – B: 
--Create and insert the following records in the EMP_MASTER table.  
--EmpNo EmpName JoiningDate Salary Commission City Dept Code 
--101 Keyur 5-1-02 12000.00 4500 Rajkot 3@g 
--102 Hardik 15-2-04 14000.00 2500 Ahmedabad 3@ 
--103 Kajal 14-3-06 15000.00 3000 Baroda 3-GD 
--104 Bhoomi 23-6-05 12500.00 1000 Ahmedabad 1A3D 
--105 Harmit 15-2-04 14000.00 2000 Rajkot 312A
CREATE TABLE EMP_MASTER(
EMPNO INT,
EMPNAME VARCHAR(20),
 JOININGDATE DATE,
 SALARY DECIMAL,
 COMMISSION DECIMAL,
 CITY VARCHAR(20),
 DEPTCODE VARCHAR(20),
);

INSERT INTO EMP_MASTER VALUES
(101,'KEYUR','2002-1-5',12000,4500,'RAJKOT','3@G'),
(102,'HARDIK','2004-2-15',14000,2500,'AHMEDABAD','3@'),
(103,'KAJAL','2006-3-14',15000,3000,'BARODA','3-GD'),
(104,'BHOOMI','2005-6-5',12500,1000,'AHMEDABAD','1A3DG'),
(105,'HARMIT','2004-2-15',14000,2000,'RAJKOT','312A');

SELECT * FROM EMP_MASTER;

--1. Display the result of Salary plus Commission. 
SELECT SALARY,COMMISSION,SALARY+COMMISSION AS TOTAL
FROM EMP_MASTER
--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2)

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
SELECT FLOOR(55.2),FLOOR(35.7),FLOOR(-55.2)

--4. Find out remainder of 55 divided 2 and 55 divided by 3. 
SELECT 55%2 ,55%3
--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
SELECT POWER(23,2),POWER(14,3)

--Part – C: 
--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.
SELECT SALARY,COMMISSION,EMPNAME,SALARY+COMMISSION AS TOTAL
FROM EMP_MASTER
WHERE COMMISSION+SALARY>15000;

--2. Find the details of employees whose commission is more than 25% of their salary. 
SELECT  *
FROM EMP_MASTER
WHERE COMMISSION>.25*SALARY;

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater 
--than 15000. 
SELECT  *
FROM EMP_MASTER
WHERE JOININGDATE<'2005' AND COMMISSION+SALARY>15000;
--4. Find employees whose total earnings (Salary + Commission) are at least double their salary. 
SELECT *
FROM EMP_MASTER
WHERE (SALARY +COMMISSION) >= 2 * SALARY;

--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN('NULL') AS NULL_LENGTH,
       LEN('HELLO') AS HELLO,
       LEN('BLANK') AS BLANK

--2. Display your name in lower & upper case. 
  SELECT LOWER('NAME') AS NAME_,
  UPPER('NAME') AS UP_CASE

--3. Display first three characters of your name.
SELECT SUBSTRING('KASHISH',1,3)

--4. Display 3rd to 10th character of your name. 
SELECT SUBSTRING('DARSHAN UNIVERSITY',3,10)

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 
SELECT REPLACE('abc123efg',123,'XYZ')

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('A') AS A_,
ASCII('a') AS a_,
ASCII('Z') AS Z_,
ASCII('z') AS z_,
ASCII('0') AS zero_,
ASCII('9') AS nine_;

--7. Write a query to display character based on number 97, 65,122,90,48,57. 
SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(48),CHAR(57),CHAR(90);

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM(' hello world  ')
--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘.
SELECT RTRIM(' hello world  ')
--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT SUBSTRING('SQL Server',1,4) as first,
SUBSTRING('SQL SERVER',LEN('SQL SERVER')-4,5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
SELECT CAST('1234.56' AS INT) AS CAST_,
CONVERT(DECIMAL,1234.56) AS CON_

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS CAST_

--13. Put 10 space before your name using function. 
SELECT SPACE(10)+('DARSHAN') AS CAST_

--14. Combine two strings using + sign as well as CONCAT (). 
SELECT 'DARSHAN' +  ' UNIVERSITY'

--15. Find reverse of “Darshan”. 
SELECT REVERSE('DARSHAN')
--16. Repeat your name 3 times. 
SELECT REPLICATE('DARSHAN',3)

--Part – B: Perform following queries on EMP_MASTER table. 
--1. Find the length of EMP Name and City columns. 
SELECT LEN('EMPNAME') AS EMP_LEN,
LEN ('CITY') AS CITY_LEN

--2. Display EMP Name and City columns in lower & upper case.
SELECT EMPNAME,CITY, LOWER(EMPNAME) AS LOWERCASE,
UPPER(EMPNAME) AS UP,
LOWER (CITY) AS LC,
UPPER(CITY) AS LC_
FROM EMP_MASTER
--3. Display first three characters of EMP Name column. 
SELECT 
  EMPNAME,
  SUBSTRING(EMPNAME, 1, 3) AS first_three_chars
FROM EMP_MASTER;

--4. Display 3rd to 10th character of city column. 
SELECT 
  CITY,
  SUBSTRING(CITY, 3, 10) AS three_chars
FROM EMP_MASTER;

--5. Write a query to display first 4 & Last 5 characters of EMP Name column. 
SELECT 
  EMPNAME,
    LEFT(EMPNAME, AS first_three_chars,
  RIGHT(EMPNAME, 5) AS LAST_FIVE
FROM EMP_MASTER;

--Part – C: Perform following queries on EMP_MASTER table. 
--1. Put 10 space before EMP Name using function. 
SELECT  EMPNAME,
CONCAT(SPACE(10),EMPNAME) AS SPAC
FROM EMP_MASTER
--2. Combine EMP Name and city columns using + sign as well as CONCAT (). 
SELECT  EMPNAME,CITY,
 CONCAT(EMPNAME,' ',CITY)
FROM EMP_MASTER
--3. Combine all columns using + sign as well as CONCAT (). 
SELECT   
 CONCAT(EMPNO,' ',EMPNAME, ' ',CITY,' ',JOININGDATE,' ',DEPTCODE,' ',SALARY,' ',COMMISSION)
FROM EMP_MASTER
--4. Combine the result as < EMP Name > Lives in <City>. 
SELECT EMPNAME +' LIVES IN '+CITY
FROM EMP_MASTER

--5. Combine the result as ‘EMP no of < EMP Name> is <EmpNo> . 
 SELECT CONCAT('EMP NO OF',' ',EMPNAME,' ','IS',EMPNO)
 FROM EMP_MASTER

--6. Retrieve the names of all employee where the third character of the Name is a vowel.
SELECT  EMPNAME
 FROM EMP_MASTER
 WHERE EMPNAME LIKE  '__[A,E,I,O,U]%'
--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that 
--starts with 'R'. 
 
 SELECT   
 CONCAT(EMPNAME,' ',CITY)
 FROM EMP_MASTER
 WHERE EMPNAME LIKE  '%R' AND CITY LIKE 'R%'


-- PART-1
-- 1. Write a query to display the current date & time. Label the column Today_Date. 
SELECT GETDATE() AS TODAY_DATE

-- 2. Write a query to find new date after 365 day with reference to today.
SELECT DATEADD(D,365,GETDATE()) AS TODAY

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
SELECT FORMAT(cast('1994-05-05 12:00' AS DATE),'MMM dd yyyy mm:ss tt') AS TODAY

--4. Display the current date in a format that appears as 03 Jan 1995.\
SELECT FORMAT(cast('1995-01-03' AS DATE),'MMM dd yyyy') AS TODAY

--5. Display the current date in a format that appears as Jan 04, 96. 
SELECT FORMAT(cast('1996-01-04' AS DATE),'MMM dd yyyy') AS TODAY
--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
SELECT DATEDIFF(MONTH,'1998-12-8','2009-3-31') AS TODAY

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
SELECT DATEDIFF(HOUR,CAST('2012-1-25  7:00' AS DATETIME),CAST('2012-1-26  10:30' AS DATETIME)) AS TODAY

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 
SELECT DAY('2016-5-12') AS DAY_,
MONTH('2016-5-12') AS MM_,YEAR('2016-5-12') AS YEAR_
--9. Write a query that adds 5 years to current date. 
SELECT DATEADD(YEAR,5,GETDATE())
--10. Write a query to subtract 2 months from current date. 
SELECT DATEADD(MM,-2,GETDATE())

--11. Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH,GETDATE()) AS CURR,
DATEPART(MONTH,GETDATE()) AS PART

--12. Write a query to find out last date of current month. 
SELECT EOMONTH(GETDATE())

--13. Calculate your age in years and months. 
SELECT DATEDIFF(YEAR,'2006-10-14',GETDATE()) AS YEAR_,
DATEDIFF(MONTH,'2006-10-14',GETDATE()) AS MON_


--Part – B: Perform following queries on EMP_MASTER table.  
--1. Write a query to find new date after 365 days with reference to JoiningDate. 
   SELECT   
   DATEADD(DAY,365,JOININGDATE)
   FROM EMP_MASTER
--2. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
   SELECT   
   DATEDIFF(MONTH,JOININGDATE,'2009-3-31')
   FROM EMP_MASTER
--3. Write a query to find out total number of years between JoiningDate and 14-Sep-10. 
SELECT   
   DATEDIFF(YEAR,JOININGDATE,'2010-9-10')
   FROM EMP_MASTER

--Part – C: Perform following queries on EMP_MASTER table. 

--1. Write a query to extract Day, Month, Year from JoiningDate. 
SELECT DAY(JOININGDATE) AS DAY_,
MONTH(JOININGDATE) AS MONTH_,
YEAR(JOININGDATE) AS YEAR_
FROM EMP_MASTER

--2. Write a query that adds 5 years to JoiningDate. 
SELECT  
DATEADD(YEAR,5,JOININGDATE) AS YEAR_
FROM EMP_MASTER
--3. Write a query to subtract 2 months from JoiningDate. 
SELECT  
DATEDIFF(MONTH,2,JOININGDATE) AS YEAR_
FROM EMP_MASTER
--4. Extract month from JoiningDate using datename () and datepart () function. 
SELECT DATENAME(MONTH,JOININGDATE) AS CURR,
DATEPART(MONTH,JOININGDATE) AS PART
FROM EMP_MASTER

--5. Select employee who joined between the 1st and 15th of any month in any year. 
SELECT  *
FROM EMP_MASTER 
WHERE DAY(JOININGDATE) BETWEEN 1 AND 15;

--6. Find employee whose JoiningDate is the last day of any month.
SELECT  *
FROM EMP_MASTER 
WHERE JOININGDATE=EOMONTH(JOININGDATE)
--7. List employee whose JoiningDate is during a leap year.
SELECT *
FROM EMP_MASTER 
WHERE (YEAR(JOININGDATE)%4=0 AND YEAR(JOININGDATE)%100!=0) OR YEAR(JOININGDATE)%400=0

