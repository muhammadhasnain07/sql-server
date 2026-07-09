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