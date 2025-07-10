CREATE TABLE STUDENT(
STUID INT,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(25),
WEBSITE VARCHAR(50),
CITY VARCHAR(25),
ADDRESS VARCHAR(100)
);
--Insert the following records in the STUDENT table.  
--StuID FirstName LastName Website City Address 
--1011 Keyur Patel techonthenet.com Rajkot A-303 �Vasant Kunj�, Rajkot 
--1022 Hardik Shah digminecraft.com Ahmedabad �Ram Krupa�, Raiya Road 
--1033 Kajal Trivedi bigactivities.com Baroda Raj bhavan plot, near garden 
--1044 Bhoomi Gajera checkyourmath.com Ahmedabad �Jig�s Home�, Narol  
--1055 Harmit Mitel @me.darshan.com Rajkot B-55, Raj Residency 
--1066 Ashok Jani NULL Baroda A502, Club House Building 

INSERT INTO STUDENT VALUES
(1011,'KEYUR','PATEL','techonthenet.com','RAJKOT','A-303 ''VASANT KUNJ'',RAJKOT'),
(1022,'HARDIK','SHAH','digminecraf.com','AHMEDABAD','''RAM KRUPA'',RAIYA ROAD'),
(1033,'KAJAL','TRIVEDI','bigactivities.com','BARODA','RAJ BHAVAN PLOT,NEAR GARDEN'),
(1044,'BHOOMI','GAJERA','checkyourmath.com','AHMEDABAD','''JIG''S HOME'',NAROL'),
(1055,'HARMIT','MITEL','@me.darshan.com','RAJKOT','B-55,RAJ RESIDENCY'),
(1066,'ASHOK','JANI',NULL,'BARODA','A502,CLUB HOUSE BUILDING');

SELECT * FROM STUDENT;
--From the above given tables perform the following queries (LIKE Operation): 
--1. Display the name of students whose name starts with �k�. 
SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE 'K%';
--2. Display the name of students whose name consists of five characters. 
SELECT FIRSTNAME
FROM STUDENT 
WHERE FIRSTNAME LIKE '_____';
--3. Retrieve the first name & last name of students whose city name ends with �a� & contains six characters. 
SELECT FIRSTNAME,LASTNAME
FROM STUDENT 
WHERE CITY LIKE '%[_____A]';
--4. Display all the students whose last name ends with �tel�. 
  SELECT *
  FROM STUDENT
  WHERE LASTNAME LIKE '%TEL';
--5. Display all the students whose first name starts with �ha� & ends with�t�.
SELECT *
  FROM STUDENT
  WHERE FIRSTNAME LIKE 'HA%T';
--6. Display all the students whose first name starts with �k� and third character is �y�.
   SELECT *
  FROM STUDENT
  WHERE FIRSTNAME LIKE 'K_Y%';

--  7. Display the name of students having no website and name consists of five characters.
SELECT FIRSTNAME
FROM STUDENT
WHERE FIRSTNAME LIKE '_____' AND 
WEBSITE IS NULL;

--8. Display all the students whose last name consist of �jer�. 
SELECT *
FROM STUDENT 
WHERE LASTNAME LIKE '%JER';
--9. Display all the students whose city name starts with either �r� or �b�. 
SELECT *
FROM STUDENT 
WHERE CITY LIKE '%[R,B]%';
--10. Display all the name students having websites. 
SELECT FIRSTNAME
FROM STUDENT 
WHERE WEBSITE IS  NOT NULL;
--11. Display all the students whose name starts from alphabet A to H.
SELECT FIRSTNAME
FROM STUDENT 
WHERE FIRSTNAME LIKE '[A-H]%';
--12. Display all the students whose name�s second character is vowel. 
SELECT FIRSTNAME
FROM STUDENT 
WHERE FIRSTNAME LIKE '_[A,E,I,O,U]%';
--13. Display the name of students having no website and name consists of minimum five characters. 
SELECT FIRSTNAME
FROM STUDENT 
WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____';
--14. Display all the students whose last name starts with �Pat�.   
SELECT FIRSTNAME,LASTNAME
FROM STUDENT 
WHERE LASTNAME LIKE 'PAT%';
--15. Display all the students whose city name does not starts with �b�. 
SELECT FIRSTNAME,LASTNAME,CITY
FROM STUDENT 
WHERE CITY LIKE '[^B]%';
--16. Display all the students whose student ID ends with digit. 
SELECT FIRSTNAME,STUID
FROM STUDENT 
WHERE STUID LIKE '%[0-9]';
--17. Display all the students whose address does not contain any digit. 
SELECT FIRSTNAME,ADDRESS
FROM STUDENT 
WHERE ADDRESS NOT LIKE  '%[0-9]%';
--18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 
--'math' or 'science'. Ensure that their city does not start with 'B'.
SELECT FIRSTNAME, LASTNAME,WEBSITE,CITY
FROM STUDENT 
WHERE FIRSTNAME LIKE 'B%' AND LASTNAME LIKE '%A' AND WEBSITE LIKE '%[math,science]%' AND (CITY NOT LIKE 'B%');
--19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their 
--website should be either null or contain 'com'. 
SELECT FIRSTNAME, LASTNAME,CITY
FROM STUDENT 
WHERE LASTNAME LIKE '%SHAH%' AND CITY LIKE '%D' AND (WEBSITE LIKE '%[.com]%' OR WEBSITE IS NULL);
--20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must 
--have a website containing '.com'. 
SELECT FIRSTNAME, LASTNAME,CITY
FROM STUDENT 
WHERE FIRSTNAME LIKE '[A,E,I,O,U][A,E,I,O,U]%' AND CITY LIKE 'R%' AND (WEBSITE LIKE '%[.com]%') ;


--Part � B: 
--1. Display all the students whose name�s second character is vowel and of and start with H. 
SELECT FIRSTNAME
FROM STUDENT 
WHERE FIRSTNAME LIKE 'H[A,E,I,O,U]%';
--2. Display all the students whose last name does not ends with �a�.
SELECT FIRSTNAME,LASTNAME
FROM STUDENT 
WHERE LASTNAME NOT LIKE  '%A';
--3. Display all the students whose first name starts with consonant.
SELECT FIRSTNAME
FROM STUDENT 
WHERE FIRSTNAME NOT LIKE '[A,E,I,O,U]%';
--4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their 
--website contains 'tech' or they live in a city starting with 'R'. 
SELECT FIRSTNAME,LASTNAME,CITY
FROM STUDENT 
WHERE FIRSTNAME LIKE 'K%'
AND (LASTNAME LIKE '%TEL')
AND (WEBSITE LIKE '%[tech]%')
AND CITY LIKE 'R%' ;
--5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They 
--must have a website that ends with '.com' and their first name should not start with 'A'.
SELECT FIRSTNAME,ADDRESS,CITY
FROM STUDENT 
WHERE ADDRESS LIKE '%[-]%'  AND  
(CITY LIKE '%[R,B]%') 
AND (WEBSITE LIKE '%[.com]%') AND
(FIRSTNAME NOT LIKE 'A%');

--Part � C: 
--1. Display all the students whose address contains single quote or double quote. 
SELECT *
FROM STUDENT 
 WHERE ADDRESS LIKE '%[''"]%';
--2. Find students whose city does not contain the letter 'S' and their address contains either single or double 
--quotes. Their last name should start with 'P' and they must have a website that contains 'on'.
SELECT FIRSTNAME,LASTNAME,CITY,ADDRESS
FROM STUDENT
WHERE CITY NOT LIKE '%[S]%'  AND
(ADDRESS LIKE '%[''"]%') AND 
(LASTNAME LIKE 'P%') AND
(WEBSITE LIKE '%[on]%');