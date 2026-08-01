create database hasnain
use  hasnain
create table mytable(id int primary key, name varchar  (20), age int)
select * from mytable
insert into mytable values (1, 'ali', 12)
insert into mytable values (2, 'hasnain', 13)
insert into mytable values (3, 'saad', 14)
insert into mytable values (4, 'farhan', 15)
drop table mytable
delete from mytable
truncate table mytable


update mytable
set age=30
where id=2

create table employee(
employeeid int,
name varchar(30),
department varchar(50),

salary decimal(10,2),
city varchar(30)
)

insert into employee(employeeid,name,department,salary,city)values
(101,'ali','IT',50000,'karachi'),
(102,'usman','faculty',60000,'lahore'),
(103,'noman','IT',80000,'karachi')

select*from employee

select*from employee
where salary>60000

select sum(salary) as Totalsalary
from employee

select count(salary) as countemployee
from employee

select department,sum(Salary) as totalsalarybyitdepartment
from employee
GROUP BY department

select department,AVG(Salary) as avgsalary
from employee
where salary>58000
GROUP BY department
having AVG(salary)>66000
order by Avgsalary DESC;

select*from employee

where salary BETWEEN 50000 AND 70000

select *from employee
where department IN ('IT','faculty')

select*from employee
where name like '%a'

SELECT *
FROM Employee
WHERE CONTAINS(Name, '%ali');

drop table employee



select *from mytable

declare @marks int = 80
if @marks>=90
begin
print'Grade A';
end
else if @marks>=80 
begin 
print 'Grade B'
end
else if @marks>=70 
begin 
print 'Grade C'
end
else 
begin
print 'fail'
end

declare @i int = 1;

while @i <= 5
begin
    print @i;
    set @i = @i + 1
end;

declare @s int = 0;

while @s < 5
begin
    set @s = @s + 1;

    if @s = 3
        continue;

    print @s;
end;

declare @s int = 0;

while @s < 5
begin
    set @s = @s + 1;

    if @s = 3
        break;

    print @s;
end

---sql server security DENY,GRAND,REVOKE

use hasnain

create table employee1(
employeeid int,
name varchar(30),
department varchar(50),
salary decimal(10,2),
city varchar(30)
)

insert into employee1(employeeid,name,department,salary,city)values
(101,'ali','IT',50000,'karachi'),
(102,'usman','faculty',60000,'lahore'),
(103,'noman','IT',80000,'karachi')

select * from employee1

create login studentlogin
with password='Student@123'

create user studentuser
for login studentlogin;

GRANT select
on employee1
to studentuser;

delete from employee1 where employeeid=101

--GRANt 
--give a permission
--see a table
--revoke
--permission revert lena

deny select
on employee1 to studentlogin


Revoke select
on employee1 to studentlogin

CREATE TABLE Employee2(
    EmployeeID int,     
    EmployeeName VARCHAR(30),
    DepartmentID INT                
);

CREATE TABLE Department (
    DepartmentID int,
    DepartmentName VARCHAR(30)
);



INSERT INTO Employee2 (EmployeeID, EmployeeName, DepartmentID)VALUES 
(101, 'ali', 1),
(102, 'saad', 2),   
(103, 'Asad', 3),  
(104, 'Aman',4);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES 
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'HR'),
(5,'IT')

select * from Employee2
select * from Department
drop table Department

SELECT 
    Employee2.EmployeeID, 
    Employee2.EmployeeName,
	Employee2.DepartmentID
FROM Employee2 

left JOIN Department  
ON Employee2.DepartmentID = Department.DepartmentID;

SELECT 
    Employee2.EmployeeID, 
    Employee2.EmployeeName,
	Employee2.DepartmentID
FROM Employee2 
right JOIN Department  
ON Employee2.DepartmentID = Department.DepartmentID;

SELECT 
    Employee2.EmployeeID, 
    Employee2.EmployeeName,
	Employee2.DepartmentID
FROM Employee2 
full JOIN Department  
ON Employee2.DepartmentID = Department.DepartmentID;


--16/07/2026
-- 1. Customers Table
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);
INSERT INTO customers (CustomerID, CustomerName, City)VALUES 
(101, 'hassan', 'karachi'),
(102, 'hasnain', 'hyd'),   
(103, 'hasan', 'pnj'),  
(104, 'hussain', 'isl');
-- 2. Products Table
CREATE TABLE products (
    productID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    productsprice DECIMAL(10, 2)
);
INSERT INTO products (ProductID, ProductName, ProductsPrice)VALUES 
(101, 'laptop', 15000),
(102, 'mobile', 20000),   
(103, 'mouse', 1000),  
(104, 'key board', 2000);

DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
-- 3. Orders Table (With Foreign Keys)
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    -- Foreign Keys defining relationship
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity)
VALUES
(1, 101, 101, '2026-07-01', 2),
(2, 102, 102, '2026-07-02', 1),
(3, 103, 103, '2026-07-03', 3),
(4, 104, 104, '2026-07-04', 2),
(5, 101, 102, '2026-07-05', 1),
(6, 102, 103, '2026-07-06', 4),
(7, 103, 104, '2026-07-07', 2),
(8, 104, 101, '2026-07-08', 1);
select * from customers
select * from products
select * from orders
SELECT
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    p.ProductsPrice,
    o.Quantity,
    (p.ProductsPrice * o.Quantity) AS TotalBill,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON o.ProductID = p.ProductID;


SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    p.ProductName,
    p.ProductsPrice,
    o.Quantity,
    (p.ProductsPrice * o.Quantity) AS TotalBill,
    o.OrderDate
FROM Customers c
right JOIN Orders o
    ON c.CustomerID = o.CustomerID
right JOIN Products p
    ON o.ProductID = p.ProductID;


	create database irdam
	use irdam

	CREATE TABLE Employee1 (
    EmployeeID INT identity(1,1),
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary decimal(10,2)
);

INSERT INTO Employee1 VALUES
('hasnain', 1,80000),
('irdam', 2,90000),
('saad', 3,50000),
('gulzaman', 4,70000);

select * from Employee1

create function myfunction44
(
    @EmpID int
)
returns Decimal(10,2)
as
begin

declare @salary decimal(10,2),@total decimal(10,2)
Select @salary=Salary from Employee1 where EmployeeID=@EmpID

set @total=@salary+(@salary*0.10)
return @total

end



exec myprocedure

create procedure getemployee1
@minsalary decimal(10,2)
as
begin
select EmployeeID,EmployeeName,Salary
from
Employee1
where Salary>=@minsalary
order by Salary DESC
end

exec getemployee1 @minsalary=70000

SELECT dbo.myfunction44(1) AS TotalSalaryWithBonus;

-- Create Database
CREATE DATABASE hh1;
GO


USE hh1;
GO



CREATE TABLE employee56
(
    empid INT IDENTITY(1,1) PRIMARY KEY,
    empname VARCHAR(30),
    salary DECIMAL(10,2),
    department VARCHAR(30),
    joiningdate DATETIME DEFAULT GETDATE()
);
GO
CREATE TABLE empployeelog
(
    logid INT IDENTITY(1,1) PRIMARY KEY,
    empid INT,
    empname VARCHAR(30),
    action VARCHAR(50),
    actiondate DATETIME DEFAULT GETDATE()
);
GO
CREATE TRIGGER trg_employee56_insert
ON employee56
AFTER INSERT
AS
BEGIN
    INSERT INTO empployeelog
    (
        empid,
        empname,
        action
    )
    SELECT
        empid,
        empname,
        'Employee Inserted'
    FROM INSERTED;
END;
GO
INSERT INTO employee56 (empname, salary, department)
VALUES
('John Doe',5500.25,'IT');
INSERT INTO employee56 (empname, salary, department)
VALUES
('Ali Khan',6500.00,'HR');
INSERT INTO employee56 (empname, salary, department)
VALUES
('Sara Ahmed',7200.50,'Finance');
GO
SELECT * FROM employee56;
GO
SELECT * FROM empployeelog;
GO
-- transaction and exceptions----

create database account
use account
create table account
(
    accountid int,
    name varchar(30),
    salary decimal(10,2)
);

insert into account values (1,'ali',50000);
insert into account values (2,'usman',60000);

select * from account;

begin try
    begin tran

    update account
    set salary = salary - 1000
    where accountid = 1;

    print('add 1000 rupees');

    select 1/0;

    update account
    set salary = salary + 1000
    where accountid = 2;

    print('sub 1000 rupees');

    commit tran;
end try

begin catch
    rollback tran;

    print 'ERROR';
    print 'Rollback';
end catch;

---view start-- = virtual table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Phone bigint
);

INSERT INTO Customer (CustomerID, FirstName, LastName, Country, Age, Phone)
VALUES
(1, 'Luca', 'Blanchi', 'Italy', 23, 034556676),
(2, 'Aiko', 'Tanaka', 'Japan', 21, 66525763),
(3, 'Carlos', 'Gomez', 'Spain', 24, 04839484),
(4, 'Sofia', 'Muller', 'Germany', 22, 02039484),
(5, 'Ethan', 'Johnson', 'USA', 25, 847347634);

select*from Customer

create view myview as select FirstName,LastName from Customer
select*from myview