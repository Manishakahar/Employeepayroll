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
 select * from emp_payroll wher  e name = 'Riya';
 
  select * from emp_payroll
  where startDate between '2010-02-10' and Date(now());
  
  -- UC 6 ----
  alter table emp_payroll add gender char (1) ;
  
  update emp_payroll set gender = 'F' where id IN (1 ,5) ;
  update emp_payroll set gender = 'M' where id = 7 ;
   
   -- UC 7 --- 
   select sum(salary) from emp_payroll;
   select gender, sum(salary) from emp_payroll group by gender ;
   
   -- UC 8 Ability to extend employee_payroll data to store employee information ---
   alter table emp_payroll 
   add phone_number varchar (30), add department varchar (30) not null ;
   alter table emp_payroll 
   add address varchar (250) default 'Mumbai';
   
   -- UC 9 Ability to extend employee_payroll table and to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay ----
   alter table emp_payroll 
   rename column salary to basic_pay; -- using alter we change the column name ----
   
  alter table emp_payroll 
  add deductions int ,
  add taxable_pay int ,
  add income_tax int ,
  add net_pay int ;
   
    -- UC 10 Ability to make Terissa as part of Sales and Marketing Department ---
insert into emp_payroll (name, basic_pay, startDate , department) 
values ('Terissa', 60000.0, '2010-02-10', 'Sales');  

insert into emp_payroll (name, basic_pay, startDate, gender,address,phone_number,department,deductions,taxable_pay,income_tax,net_pay)
values ('Terissa', 60000.0, '2010-02-10', 'F','Mumbai', 9483732,'Marketing',300000,45763,3234,43434);  

-- UC 11 Implementing the ER Diagram into Payroll Service DB ---

create table employee (
id int not null auto_increment  primary key ,
name varchar(50) not null, 
gender varchar (1),
phone varchar (30),
address varchar(300),
startDate  Date not null
);
 select * from employee;
 create table payroll (
id int not null auto_increment  primary key ,
basic_pay int,
deuctions int,
income_tax int,
taxable_pay int, 
net_pay int ,
emp_id int ,
foreign key(emp_id) references employee (id)
 );
 
 create table department (
 id int not null auto_increment primary key,
 dept_name varchar (20) not null
 );
 
 -- for mentening a relationship between two(employee_id,department_id) table  many to many --- 
 
  create table employee_department(  
   employee_id int  not null,
   department_id  int not null,
   foreign key(employee_id) references employee (id),
   foreign key (department_id) references department(id),
   primary key(employee_id,department_id)
  );
  select * from employee_department;
  desc employee_department;
  
 
