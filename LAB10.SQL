CREATE TABLE STUDENT_INFO
(
RNO INT,
NAME VARCHAR(20),
BRANCH VARCHAR(20),
SPI DECIMAL(3,2),
BKLOG INT
)
INSERT INTO STUDENT_INFO VALUES
(101,'RAJU','CE',8.8,0),
(102,'AMIT','CE',2.2,3),
(103,'SANJAY','ME',1.5,6),
(104,'NEHA','EC',7.65,1),
(105,'MEERA','EE',5.52,2),
(106,'MAHESH','EC',4.5,3);

SELECT * FROM STUDENT_INFO;

--1. Create a view Personal with all columns. 
CREATE VIEW PERSONAL
AS
SELECT * FROM STUDENT_INFO
--2. Create a view Student_Details having columns Name, Branch & SPI.  
CREATE VIEW STUDENT_DETAILS
AS
SELECT  
NAME,BRANCH,SPI
FROM STUDENT_INFO
--3. Create a view AcademicData having columns RNo, Name, Branch. 
CREATE VIEW ACADEMICDATA
AS
SELECT  
RNO,NAME,BRANCH
FROM STUDENT_INFO
 DROP  VIEW ACADEMICDATA
 SELECT * FROM ACADEMICDATA
--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
CREATE VIEW STUDENT_BKLOG
AS
SELECT  
*
FROM STUDENT_INFO
WHERE BKLOG>2
--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four 
--letters. 
CREATE VIEW STUDENT_PATTERN
AS
SELECT  
RNO,BRANCH,NAME
FROM STUDENT_INFO
WHERE NAME LIKE '____'
--6. Insert a new record to AcademicData view. (107, Meet, ME) 
 INSERT INTO ACADEMICDATA VALUES
 (107,'MEET','ME');
--7. Update the branch of Amit from CE to ME in Student_Details view. 

--8. Delete a student whose roll number is 104 from AcademicData view. 
--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and 
--backlog less than 2. 
--10. Create the view for the students whose name contains vowel.