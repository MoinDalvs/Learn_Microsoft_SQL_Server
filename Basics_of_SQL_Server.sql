-- how to create database

create database Test;

-- how to delete a database

drop database Test;

-- How to use database

use Test

-- Creating table with columns (not inserting values)

create table emp_details
(emp_id int,
first_name varchar(20) not null,
last_name varchar(20) not null);

-- How to view all rows and column in a database

select * from emp_details;

-- How to rename column in SQL Server (microsoft sql server)

EXEC sp_rename 'emp_details.emp_id', 'Emp_Id';

-- Alter table command which helps to add constraints or add column or modify in an already existing table

alter table emp_details add age int;

alter table emp_details alter column age varchar(5);

alter table emp_details alter column age varchar(5) not null;

alter table emp_details drop column age;

alter table emp_details add salary numeric (10,2);

alter table emp_details drop column salary;

-- How to delete table from a database

drop table emp_details;

-- Again creating table with column names

create table emp_details
( emp_id int primary key,
last_name varchar (20) not null,
first_name varchar(20) not null);

drop table emp_details;

-- How to add primary key constraint while creating table in database

create table emp_details
( emp_id int,
first_name varchar(20),
last_name varchar(20),
constraint emp_pk primary key (emp_id)
);

drop table emp_details;

-- Different method to add primary key constraint while creating table and adding column names to it

create table emp1
( first_name varchar(20),
last_name varchar(20),
salary money,
constraint emp1_pk primary key (first_name, last_name)
);

drop table emp1;

-- How to add primary key constraint after creating a table with column names

create table emp2
( emp_id int not null,
first_name varchar(20),
last_name varchar(20));

alter table emp2
add constraint emp2_pk primary key (emp_id);

drop table emp2;

-- How to drop constraint from a table

ALTER TABLE emp2 DROP CONSTRAINT emp2_pk;

-- How to drop multiple tables

drop table emp1, emp2;

-- How to create parent table with primary key

create table product
(prod_id int primary key,
prod_name varchar(25),
categary varchar(40)
);

-- How to add foreign key while creating child table with reference to primary key of parent table

create table orders
(order_id int primary key,
prod_id int not null,
quantity int,
constraint fk_product_id foreign key (prod_id)
references product (prod_id)
);

-- How to add foreign key after creating a child table

create table product1
(prod_id int primary key,
prod_name varchar(25),
categary varchar(40)
);

create table orders1
(order_id int primary key,
prod_id int not null,
quantity int
);

alter table orders1
add constraint fk_product_id1
foreign key (prod_id)
references product1 (prod_id);

drop table product1;-- You will get an error "Could not drop object 'product1' because it is referenced by a FOREIGN KEY constraint."

-- How to delete parent table and child table

drop table orders1;
drop table product1;

-- On delete cascade will delete foreign key data from both parent as well as child table

create table product1
(prod_id int primary key,
prod_name varchar(25),
categary varchar(40)
);

create table orders1
(order_id int primary key,
prod_id int not null,
quantity int
);

alter table orders1
add constraint fk_product_id1
foreign key (prod_id)
references product1(prod_id)
on delete cascade;

drop table product1; -- you will still get an error but if you delete data from parent table this will delete data from child table as well

drop table "orders1", product1;

select * from product1;

-- Various Constraints example

create table employee(
emp_id numeric(4) primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
mgr_id numeric(4) not null,
phone_number varchar(10) unique,
job_id numeric(2),
deptno numeric(2));

-- Creating Views
-- by creating views we are creating a virtual table, we can query our view in same way we query sql tables

use Test

create view testview as select * from employee;

-- if we don't want all the column and rows we can specify through query

create view testview1 as select emp_id, first_name from employee;

-- Data manipulation Commands Insert, Delete, Update

-- Insert statements

CREATE DATABASE Emp_Dept;

USE Emp_Dept
CREATE TABLE Department
(
dept_no INT NOT NULL,
dept_name VARCHAR(20) NOT NULL,
location NVARCHAR(20)
PRIMARY KEY (dept_no)
);

-- Using Insert statement to insert multiple values in the table

INSERT INTO Department (dept_name, location, dept_no)
VALUES('Accounts', 'Chennai', 10),
('HR', 'Hyderabad', 20),
('IT', 'Bangalore', 30),
('Marketing', 'Chennai', 40),
('Sales', NUll,50);

-- How to display the table with all rows and columns

Select * from Department;

-- Insert - As - Select statement

create table dept(
dept_no INT NOT NULL,
dept_name VARCHAR(20) NOT NULL,
location NVARCHAR(20)
PRIMARY KEY (dept_no)
);

-- If we want all the columns and rows

insert into dept (dept_no, dept_name, location)
(select * from Department);

select * from dept;

-- If we want only specific rows
--WHERE CLAUSE

drop table dept;

insert into dept (dept_no, dept_name, location)
(select * from Department where dept_no > 20);

select * from dept;

-- If we want only specific columns

drop table dept;

insert into dept (dept_no, dept_name)
(select dept_no, dept_name from Department);

select * from dept;

-- Update Statements

UPDATE Department SET dept_name = 'Marketing' WHERE dept_no = 30;

UPDATE Department SET dept_name = 'Marketing' --WHERE dept_no = 30;

USE Emp_Dept
DELETE FROM Department;

DELETE FROM Department WHERE dept_no = 40;

Select * from Department;

insert into Department ( dept_no, dept_name, location)
values(40, 'Marketing', 'Chennai')

-- Select Query

CREATE TABLE Employee
   (
   Employee_ID INT PRIMARY KEY,
   First_name VARCHAR(15) NOT NULL,
   Last_name VARCHAR(15) NOT NULL,
   Address VARCHAR(15),
   );

   INSERT INTO Employee
   VALUES (101, 'Jackson', 'Joe', 'Mumbai'),
   (102, 'Smith', 'Jane', 'New Delhi'),
   (103, 'Ferguson', 'Samantha', 'Kolkata'),
   (104, 'Reynolds', 'Allen', 'Benguluru'),
   (105, 'Anderson', 'Paige', NULL),
   (106, 'Johnson', 'Derek', 'Chennai');

Select * from Employee;

CREATE TABLE Empl_details
(
emp_id INT PRIMARY KEY,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
manager_id INT,
phone_number VARCHAR(10),
hire_date DATE,
job_profile VARCHAR(5) NOT NULL,
dept INT NOT NULL,
salary SMALLMONEY,
);

ALTER TABLE Empl_details
ALTER COLUMN salary money;

INSERT INTO Empl_details
VALUES
(1001, 'Allen', 'Finch', NULL, NULL, NULL, 'J7', 10, NULL),
(1002, 'Scott', 'Tiger', 1001, NULL, NULL, 'J2', 10, NULL),
(1003, 'Martin', 'Blake', 1001, NULL, NULL, 'J3', 10, NULL),
(1004, 'Arun', 'Turner', NULL, NULL, '2008-06-05', 'J4', 20, 40000),
(1005, 'John', 'Root', 1004, NULL, '2010-01-10', 'J5', 20, NULL),
 (1006, 'Nithya', 'Jones', 1001, NULL, '1999-02-12', 'J6', 30, 500000),
 (1007, 'Smith', 'Ruth', 1006, NULL, '2010-07-21', 'J1', 10, 30000),
 (1008, 'Miller', 'Ward', 1001, NULL, NULL, 'J8', 40, NULL),
 (1009, 'Alex', 'Fin', NULL, NULL, NULL, 'J7', 30, NULL);

Select * from Empl_details;

Select top(3) * from Employee;

Select top(3) First_name, Last_name from Employee;

Select dept_no as 'Department No', dept_name as 'Department Name' from Department;

SELECT CASE(location)
  WHEN 'Chennai' THEN 'Tamil Nadu'
  WHEN 'Banglore' THEN 'Karnataka'
  WHEN 'Hyderabad' THEN 'Telangana'
  ELSE 'Unidentified'
  END
  FROM Department;

select * from Empl_details where salary is null;

select * from Empl_details where salary is not null;

-- Select Statement : Distinct Values

Select * from department;

select distinct location from department;

-- order by

select * from department
order by dept_no desc;

select top(2) * from department
order by dept_no desc;

-- Filtering: Logical Operators(AND, OR and NOT)

select * from department where dept_no = 10 and dept_name = 'HR';

select * from department where dept_no = 20 and dept_name = 'HR';

select * from department where dept_no = 10 or dept_name = 'HR';

select dept_name, location from department where location not in ('Chennai','Hyderabad');

-- Filterin: Comparison Operators (=, !=, <>, >=, <=, Like , Between, In)

select * from Empl_details where salary between 20000 and 35000;

use emp_dept;

select * from department where location in ('Chennai', 'Bangalore');

select * from department where location like ('C%');

select * from department where location like ('Che____');

select * from department where location like ('Bang%');

select * from Empl_details where salary >= 20000;

select * from Empl_details where salary > 30000;

select * from Empl_details where salary < 50000;

-- Joins

Select * from Employee;

select * from Orders;

-- Inner Join
-- Query only show those employee who have ordered

SELECT E.Employee_ID, E.First_name, O.Order_ID, O.Order_date
  FROM Employee E
  INNER JOIN Orders O
  ON E.Employee_id = O.Employee_id
  ORDER BY Employee_id;

Select E.Employee_ID, O.Order_ID, O.Order_Date, E.Address
From Employee E
Inner Join Orders O
On  E.Employee_ID = O.Employee_ID
where E.Employee_ID > 103
order by E.Employee_ID;

  -- Older Syntax
SELECT E.Employee_ID, O.Order_ID, O.Order_date
  FROM Employee E, Orders O
  WHERE E.Employee_id = O.Employee_id
  ORDER BY Employee_id;

-- Self Join

SELECT E.Employee_ID, E.First_name, E1.Address, E1.Last_name
  FROM Employee E
  INNER JOIN Employee E1
  ON E.Employee_id = E1.Employee_id
  ORDER BY Employee_id;

-- Left Outer Join

SELECT E.Employee_ID, O.Order_ID, E.First_name, E.Last_name, O.Order_Date
FROM Employee E
LEFT OUTER JOIN Orders O
ON E.Employee_ID = O.Employee_ID
ORDER BY E.Employee_ID;

SELECT *
FROM Employee E
LEFT JOIN Orders O
ON E.Employee_ID = O.Employee_ID
ORDER BY E.Employee_ID;

-- Right Outer Join

SELECT E.Employee_ID, O.Order_ID, O.Order_Date
FROM Employee E
RIGHT OUTER JOIN Orders O
ON E.Employee_ID = O.Employee_ID
ORDER BY O.Order_ID;

SELECT *
FROM Employee E
RIGHT JOIN Orders O
ON E.Employee_ID = O.Employee_ID
ORDER BY O.Order_ID;

-- Full Join

USE Emp_Dept
SELECT E.Employee_ID, O.Order_ID, O.Order_Date
FROM Employee E
FULL OUTER JOIN Orders O
ON E.Employee_ID=O.Employee_ID
ORDER BY E.Employee_ID;

USE Emp_Dept
SELECT *
FROM Employee E
FULL JOIN Orders O
ON E.Employee_ID=O.Employee_ID
ORDER BY E.Employee_ID;

-- Cross Join

SELECT E.Employee_Id, O.Order_ID, O.Order_Date
FROM Employee E
CROSS JOIN Orders O
ORDER BY E.Employee_ID; 

SELECT *
FROM Employee E
CROSS JOIN Orders O
ORDER BY E.Employee_ID;

-- SQL Built in Functions

-- Conversion Funciton

SELECT CAST('10' AS INT) * 20 AS Cast_Ver,
CONVERT(INT, '10') * 20 AS Convert_Ver;

SELECT TRY_CONVERT(INT, '100') * 20 AS 'Try Convert';

SELECT CAST('A' AS INT) * 20 AS Cast_Ver;

SELECT TRY_CONVERT(INT, 'X100') * 20 AS 'Try Convert';

SELECT TRY_CONVERT(INT, 'A')*20 AS TryCastresult;

-- Logical Functions

SELECT CHOOSE (3,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (4,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (0,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (6,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (3.5,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (3.4,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE (3.9,'Test','Rest','Zest','West','Nest');

SELECT CHOOSE(1.4,'A','B','C','D');

SELECT IIF(1>2, 'TRUE', 'FALSE') AS Result;

SELECT IIF(1.46>1.45, 'TRUE', 'FALSE') AS Result;

-- Math Functions

SELECT SQRT(16)

SELECT SQRT(16) * SQUARE(4) AS RESULT;

select sqrt(16) + square(2) as Result;

select sqrt(16) - square(4) as Result;

select abs(sqrt(16) - square(4)) as Result;

SELECT ABS(SQUARE(2) - SQRT(1225));

SELECT ABS(-15);

Select 2*2*2*2;

SELECT POWER(2,4);

-- Aggregate Functions

USE Emp_Dept
SELECT AVG(dept_no) FROM Department;
SELECT * FROM Department;

Select AVG(Salary) from Empl_details;

select * from Empl_details;

select avg(dept_no) from Empl_details;

SELECT AVG(DISTINCT dept_no) FROM Empl_details;

SELECT COUNT(DISTINCT Salary) FROM Empl_details;

SELECT COUNT(Salary) FROM Empl_details;

SELECT COUNT(*) FROM Empl_details;

select min(distinct salary) from Empl_details;

SELECT MIN(dept_no) FROM Department;

SELECT MAX(Salary) FROM Empl_details;

Select sum(salary) as 'Sum of Salary' from Empl_details;

SELECT MAX(location) AS Location FROM Department;

select avg(salary) As 'Average Salary', Min(salary) as 'Minimum Salary', max(salary) as 'Maximum Salary',
Sum(salary) as 'Sum of Salary' from Empl_details;

select * from Empl_details;

-- String Functions

SELECT REVERSE('WASITACARORACATISAW');

SELECT REVERSE('STRESSED') AS 'Reserse String';

SELECT REVERSE('EVIL') AS 'Reserse String';

SELECT REVERSE('LIVED') AS 'Reserse String';

SELECT REVERSE('RACECAR') AS 'Reserse String';

SELECT REVERSE('?GNIKROW YLLAER SIHT SI') AS 'Reserse String';

SELECT REVERSE('KNITS') AS 'Reserse String';

SELECT REVERSE('DOG') AS 'Reserse String';

SELECT REVERSE('WAR') AS 'Reserse String';

SELECT REVERSE('TRAMS') AS 'Reserse String';

SELECT REVERSE('SNUG') AS 'Reserse String';

SELECT REVERSE('!OS KNIHT TNOD I') AS 'Reserse String';

SELECT LTRIM('       On your left said Captain America    ');

SELECT RTRIM('Right     ');

SELECT TRIM('       Centre    ');

SELECT LOWER('JOBU');

SELECT UPPER('jobu');

select replace('Dalvi Sana Saleem','Sana','Moin') as 'Replace',
substring('Dalvi Moin Saleem', 7,4) as 'Substring', 
Left('Dalvi Moin Saleem', 5) as 'Left',
right('Dalvi Moin Saleem',6) as 'Right';\

-- Date and Time functions

SELECT DATEPART(mm,'15-DEC-1996') AS 'MONTH';

SELECT DATEIFF();

SELECT DATEADD(mm,2,'12/31/2015');

SELECT DATEADD(dd,31,'12/31/2015');

select
sysdatetime() as 'SYSDATETIME', Current_Timestamp as 'TimeStamp',
datepart(year, '12-DEC-2017') as 'Datepart',
Datediff (mm, '12/31/2015', '10/23/2016') as 'Datediff' ,
Dateadd(mm, 2, '12/31/2015') as 'Dateadd';

-- Group By Function

USE Emp_Dept

select dept_no, count(*) from Empl_details group by Dept_No;

SELECT dept_no AS 'Department Number',COUNT(*) AS 'Count' FROM Department
GROUP BY dept_no;

SELECT dept_no AS 'Department Number', location ,
COUNT(*) AS 'Count' FROM Department
GROUP BY dept_no, location;

select dept_no, avg(salary) as AVGSal, min(salary) as MinSal, Max(Salary) as MaxSal, sum(salary) as SumSal 
from Empl_details group by Dept_No;

select job_id, Count(*) from Empl_details
group by job_id;

-- Having Clause

SELECT Job_ID, COUNT(*) FROM Empl_details
GROUP BY Job_ID
HAVING MIN(Salary) > 30000;

-- deptno wise avg, min, max, sum salary, with sum of salary > 30000

select dept_no, avg(salary) as AVGSal, min(salary) as MinSal, Max(Salary) as MaxSal, sum(salary) as SumSal 
from Empl_details group by Dept_No having sum(salary) > 30000;

-- Stored Procedure

select * from Empl_details;

create procedure sp_GetEmployeeInfo(@empid INT)
as begin 
select emp_id, first_name, last_name, manager_id, phone_number, hire_date, Job_id, Dept_no, salary
from Emp_Dept.dbo.Empl_details
where emp_id = @empid
end;

exec dbo.sp_GetEmployeeInfo
@empid = 1004

GO
CREATE PROCEDURE dbo.uspGETDeptDetails
AS
SELECT * FROM Department
GO;

EXEC dbo.uspGETDeptDetails;

dbo.uspGETDeptDetails;

USE Emp_Dept
GO
CREATE PROC dbo.uspGetDetails
@Dept_No NVARCHAR(2)
AS
SELECT * FROM Department
WHERE dept_no = @Dept_No;

EXEC dbo.uspGetDetails @Dept_No = 30;

dbo.uspGetDetails @Dept_No = 30;

USE Emp_Dept
GO
Create PROCEDURE dbo.uspGetFull_name
@emp_id INT
AS
SELECT first_name + SPACE(1) + last_name AS 'Full Name' FROM Empl_details
WHERE @emp_id = emp_id;

dbo.uspGetFull_name @emp_id = 1002;

SELECT * FROM Empl_details;

CREATE PROCEDURE dbo.uspNULLexample
@Dept_No NVARCHAR(2) = NULL
AS
SELECT * FROM Department
WHERE dept_no = @Dept_No
GO;

CREATE PROCEDURE dbo.GetDetailsFrom
@DeptNo NVARCHAR(2) = NULL,
@DeptName NVARCHAR(10) = NULL
AS
SELECT * FROM Department
WHERE dept_no = @DeptNo
AND dept_name = @DeptName
GO

Getdetailsfrom @DeptNo = 50, @DeptName = 'Sales';

CREATE PROCEDURE dbo.uspGetCOUNT
--Define Parameters
/* This is multiparameter Stored procedure
Having output parameter*/
@Deptno NVARCHAR(10), 
@COUNT int OUTPUT
AS
SELECT @COUNT = COUNT(*)
FROM Department
WHERE dept_no = @Deptno;

DECLARE @COUNT INT
EXEC dbo.uspGetCOUNT @Deptno = 10, @COUNT = @COUNT OUTPUT
SELECT @COUNT;

CREATE PROCEDURE dbo.uspTryCatchTest
AS 
BEGIN TRY
SELECT 1/0
END TRY
BEGIN CATCH 
SELECT ERROR_NUMBER() AS 'ErrorNumber',
ERROR_SEVERITY() AS 'ErrorSeverity',
ERROR_PROCEDURE() AS 'ErrorProcedure',
ERROR_LINE() AS 'ErrorLine',
ERROR_MESSAGE() AS 'ErrorMessage',
ERROR_STATE() AS 'ErrorState';
END CATCH;

EXEC dbo.uspTryCatchTest;

-- User Defined Functon 
-- Scalar Function is sub category of the above 

USE Emp_Dept
CREATE FUNCTION No_Parameter()
RETURNS INT
AS BEGIN
RETURN (SELECT SUM(Salary) FROM Empl_details)
END;

ALTER FUNCTION No_Parameter()
RETURNS INT
AS BEGIN
RETURN (SELECT SUM(Salary) FROM Empl_details)
END;

SELECT dbo.No_Parameter() AS Total_Salary;

ALTER FUNCTION No_Parameter()
RETURNS INT
AS BEGIN
RETURN(SELECT AVG(Salary) FROM Empl_details)
END;

SELECT dbo.No_Parameter() AS AVG_Salary;

USE Emp_Dept
SELECT dbo.No_parameter()

SELECT * FROM Empl_details
WHERE salary > dbo.No_parameter();

CREATE FUNCTION Full_Name(@first_name VARCHAR(10), @last_name VARCHAR(10))
RETURNS VARCHAR(20)
AS BEGIN
RETURN (SELECT @first_name + SPACE(1) + @last_name)
END;

SELECT dbo.Full_Name('Moin','Dalvi') AS 'Full Name';

CREATE FUNCTION Empl_fullname(@emp_id INT)
RETURNS VARCHAR(20)
AS BEGIN
Return (SELECT first_name + SPACE(1) + last_name AS 'Full Name' FROM Empl_details
WHERE @emp_id = emp_id)
END;

select * from Empl_details;
select dbo.Empl_fullname(1004);

-- User defined Function: Inline table-Valued Function

Create function Empl_FullNames(@emp_id INT)
RETURNS Table
AS
Return (SELECT emp_id, first_name + SPACE(1) + last_name AS 'Full Name', manager_id, hire_date,
Job_id, Dept_no, Salary FROM Empl_details WHERE @emp_id = emp_id);

select * from Empl_FullNames(1001);

Alter function Empl_FullNames(@emp_id INT)
RETURNS Table
AS
Return (SELECT emp_id, first_name + SPACE(1) + last_name AS 'Full Name', manager_id, hire_date,
Job_id, Dept_no, Salary FROM Empl_details WHERE @emp_id > emp_id);

select * from Empl_FullNames(1004);

Alter function Empl_FullNames(@emp_id INT)
RETURNS Table
AS
Return (SELECT emp_id, first_name + SPACE(1) + last_name AS 'Full Name', manager_id, hire_date,
Job_id, Dept_no, Salary FROM Empl_details WHERE @emp_id <= emp_id);

select * from Empl_FullNames(1001);

Alter function Empl_FullNames()
RETURNS Table
AS
Return (SELECT emp_id, first_name + SPACE(1) + last_name AS 'Full Name', manager_id, hire_date,
Job_id, Dept_no, Salary FROM Empl_details);

select * from Empl_FullNames() 

-- Multi-Statement Table-Valued Function

Alter function GetEmployeeInfo(@Dept_id INTEGER)
Returns @retGetEmployeeInfo Table
(
EmpID Int primary Key Not null,
FullName nvarchar(20) NOt null,
DeptNo INT not null
)
AS
BEGIN
Insert @retGetEmployeeInfo
Select emp_id as 'Employee Id', first_name + space(1) + last_name as 'Full Name', dept_no as 'Department No'
From Empl_details
where Dept_No = @Dept_id
Return
END;

select * from GetEmployeeInfo(10);

select * from GetEmployeeInfo(20);

-- Trigger

Create trigger safety_patch on database for
create_table, alter_table, drop_table
as 
print'you can not create, drop and alter table in  this database'
rollback;

