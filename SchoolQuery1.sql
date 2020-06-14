/* fisrt we are creating tables we discussed in the ER diagram 
and we are specigying the primary and foreign keys */

CREATE TABLE [student] (
  [student_ID] bigint,
  [student_name] varchar(50),
  [student_age] int,
  PRIMARY KEY ([student_ID])
);

CREATE TABLE [school] (
  [school_name] varchar(50),
  [student_ID] bigint,
  [class_number] int,
  [school_stage] varchar(50),
  [school_adress] varchar(50),
  PRIMARY KEY ([school_name])
);

CREATE INDEX [FK] ON  [school] ([student_ID], [class_number]);

CREATE TABLE [class_] (
  [class_number] int,
  [students_number] int,
  [class_supervisor] varchar(50),
  [academic_year] varchar(50),
  PRIMARY KEY ([class_number])
);

/* Here we are inserting some data to each table to try select fonctions on
i added three objects to each table */

-- insrting data to student table
insert into student
(student_ID,student_name,student_age)
values
(098567,'Ali',15);
insert into student
(student_ID,student_name,student_age)
values
(123654,'Maher',15);
insert into student
(student_ID,student_name,student_age)
values
(567432,'Zahra',11);

-- inserting data to school table
insert into school
(school_name,student_ID,class_number,school_stage,school_adress)
values
('SalahEldin School',098567,3,'secondary','Alexandria');
insert into school
(school_name,student_ID,class_number,school_stage,school_adress)
values
('Elwatan School',123654,4,'secondary','Cairo');
insert into school
(school_name,student_ID,class_number,school_stage,school_adress)
values
('Eltaawon School',567432,5,'primary','Mansoura');

-- inserting data to class table
insert into class_
(class_number,students_number,class_supervisor,academic_year)
values
(3,20,'Mr Ahmed','Grade 5');
insert into class_
(class_number,students_number,class_supervisor,academic_year)
values
(4,25,'Mr Tawfeek','Grade 5');
insert into class_
(class_number,students_number,class_supervisor,academic_year)
values
(5,22,'Mrs Hannan','Grade 2');



/* here we are testing Select Statements using Different Functions 
we are using 20 functions on our data we have inserted before*/

-- 1) How to convert string using select statement?
select LOWER (student_name) As Lowerclassstudent_name
from dbo.student
where student_ID = 098567;
-- 2) How to concatinate two strings using select statement?
select CONCAT_WS ('&' , student_Name , 'Hassan')
from dbo.student
where student_ID = 567432;
-- 3) How to caculate the lenght of string using select statement?
select LEN (school_adress)
from dbo.school
where school_name = 'Elwatan School';
-- 4) How to reverse string using select statement?
select REVERSE (school_adress)
from dbo.school
where school_name = 'SalahEldin School';
-- 5) How to extract number of characters from the right out of string?
select RIGHT(student_name, 2) as ExtractString
from dbo.student
where student_ID = 567432;
-- 6) How to convert a number to string using select statement?
select STR (student_age)
from dbo.student
where student_ID = 123654;
-- 7) How to replace number of characters in string using select statement?
select STUFF (class_supervisor, 1, 2, 'Teacher')
from dbo.class_
where class_number = 3;
-- 8) How to  convert string to upperclass using select statement?
select UPPER (student_Name) AS Upperclassstudent_Name
from dbo.student;
-- 9) How to extract number of characters out of string using select statement?
select SUBSTRING (student_Name, 1, 3) AS ExtractString
from dbo.student
where student_ID = 123654;
-- 10) How to calculate cos of number using select statement?
select COS (class_number)
from dbo.school
where school_name = 'Eltaawon School';
-- 11) how to return the cotangent of number using select statement?
select COT (student_ID)
from dbo.school
where school_name = 'Elwatan School';
-- 12) How to return e raised to the power of number using select statement?
select EXP(class_number)
from dbo.school
where school_name = 'SalahEldin School';
-- 13) How to get log10 of number using select statement?
select LOG10 (student_ID)
from dbo.school
where school_name = 'Elwatan School';
-- 14) How to get the maximum number of column using select statement?
select MAX (class_number) AS Largestclass_number
from dbo.school;
-- 15) How get the minimum number of column using select statement?
select MIN (class_number) AS Smallestclass_number
from dbo.school;
-- 16) How to get a random number using select statement?
select RAND (student_age)
from dbo.student
where student_ID = 567432;
-- 17) How to return the sin of number using select statement?
select SIN (class_number)
from dbo.school;
-- 18) How to return the SQRT of number using select statement?
select SQRT (student_ID)
from dbo.student
where student_age = 20;
-- 19) How to return the square of number using select statement?
select SQUARE (student_age)
from dbo.student;
-- 20) How to return the tan of number using select statement?
select TAN (class_number)
from dbo.school;



/* here we are testing select statements using different joins, Sub Query and Count and Group Functions
on the data we have inserted and here we finish select statements task*/

-- Sub Query
-- 1)
select student_Name from student where student_ID in (select student_ID from school where school_name = 'Elwatan School');
-- 2)
select students_number from class_ where class_number in (select class_number from school where student_ID = 098567);
-- 3)
select school_adress from school where class_number in (select class_number from class_ where students_number = 25);
-- Count an Group
select COUNT (student_Name)
from student;
-- 1)
select student_Name , COUNT(student_ID)
from student
group by student_Name;
-- 2)
select school_name , COUNT(student_ID)
from school
group by school_name
-- Different Joins
-- 1)
select student_Name , school_name
from student , school
where school.student_ID = student.student_ID;
-- 2)
select school_name , students_number
from class_ , school
where school.class_Number = class_.class_Number;
-- 3)
select student_age , school_adress
from student , school
where school.student_ID = student.student_ID;
-- 4)
select student_ID , academic_year
from school , class_
where school.class_Number = class_.class_Number;
-- 5)
select student_name , school_adress
from student , school
where school.student_ID = student.student_ID;



/* here we show some examples of updating data 
in class we need to change information about anything */
-- 1)
update dbo.student
set student_Name = 'Ziad'
where student_Name = 'Ali';
-- 2)
update dbo.school
set school_stage = 'secondary'
where school_name = 'Eltaawon School';
-- 3)
update dbo.class_
set students_number = 30
where class_Number = 3;
-- 4)
update dbo.student
set student_age = 16
where student_ID = 123654;
-- 5)
update dbo.school
set school_adress = 'Giza'
where school_name = 'Elwatan School';



/* here we show some examples of deleting data
in class a student finished his academic_year or some data become out of date */
-- 1)
delete dbo.student
where student_ID = 123654;
-- 2)
delete dbo.school
where school_name = 'Elwatan';
-- 3)
delete dbo.class_
where class_Number = 3;
-- 4)
delete dbo.class_
where academic_year = 'Grade 2';
-- 5)
delete dbo.school
where student_ID = 567432;