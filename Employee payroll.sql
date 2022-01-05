--  UC1 --
show databases ;
create database emp_payroll_service;
use emp_payroll_service; 

-- UC2 --
create table emp_payroll (
id int not null auto_increment ,
name varchar(50) not null,
salary Double not null,
startDate  Date not null,
primary key (id)
);
desc emp_payroll;
----- UC3 ----
insert into emp_payroll (name, salary, startDate) 
values ('Manisha', 50000.0, '2010-01-10');  

insert into emp_payroll (name, salary, startDate) 
values ('Rahul', 80000.0, '2010-03-10');  

insert into emp_payroll (name, salary, startDate) 
values ('Riya', 60000.0, '2010-02-10');  

-- UC4 ---
 select * from emp_payroll;
 
 ----- UC5 -----
 select * from emp_payroll where name = 'Riya';
 
  select * from emp_payroll
  where startDate between '2010-02-10' and Date(now());
  
  -- UC6 ----
  alter table emp_payroll add gender char (1) ;
  
  update emp_payroll set gender = 'F' where id IN (1 ,5) ;
  update emp_payroll set gender = 'M' where id = 6 ;
   
   -- UC7 --- 
   select sum(salary) from emp_payroll;
   select gender, sum(salary) from emp_payroll group by gender ;