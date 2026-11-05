create database jannath;
use jannath;
create table employee(employee_id int auto_increment primary key,first_name varchar(50),last_name varchar(50),salary int,joining_date date, department varchar(50));
insert into employee(employee_id,first_name,last_name,salary,joining_date,department)
values(1,'Bob','Kinto',1000000,"2019-01-20","Finance"),
(2,'Jerry','Kansxo',6000000,"2019-01-15","IT"),
(3,'Philip','Jose',8900000,"2019-02-05","Banking"),
(4,'John','Abraham',2000000,"2019-02-25","Insurance"),
(5,'Michael','Mathew',2200000,"2019-02-28","Finance"),
(6,'Alex','Chreketo',4000000,"2019-05-10","IT"),
(7,'Yohan','Soso',1230000,"2019-06-20","Banking");
select*from employee;

create table reward(employee_ref_id int,date_reward date,amount int,foreign key(employee_ref_id)references employee(employee_id));
insert into reward(employee_ref_id,date_reward,amount)
values(1,'2019-05-11','1000'),
(2,'2019-02-15','5000'),
(3,'2019-04-22','2000'),
(1,'2019-06-20','8000');
select*from reward;

# q1
select first_name,length(first_name)
as length
from employee;
# q2
select replace(first_name,'o','#')
as first_name
from employee;
# q3
select concat(last_name,'_',first_name)
as employee_name
from employee;
# q4 
select year(joining_date) as year,
month(joining_date)as month,
day(joining_date)as day
from employee;
# q5
select*from employee 
order by first_name asc;
# q6
select*from employee
order by first_name desc;
# q7
select*from employee
order by first_name asc,
salary desc;
# q8
select*from employee
where first_name='Bob';
# q9
select*from employee
where first_name in ('Bob','Alex');
# q10
select*from employee
where first_name not in ('Bob','Alex');
# q11
select*from employee
where first_name like'B%';
# q12
select*from employee
where first_name like'%o%';
# q13
select*from employee
where  first_name like '%n';
# q14
select*from employee
where first_name like'__n';
# q15
select*from employee
where first_name like'J__';
# q16
select*from employee
where salary >3000000;
# q17
select* from employee
where salary <3000000;
# q18
select*from employee
where salary between 2000000 and 5000000;
# q19
select*from employee
where first_name ='Bob'
or first_name='Alex';
# q20
select*from employee
where year(joining_date)=2019;
# q21
select*from employee
where month(joining_date)=1;
# q22
select*from employee
where joining_date <'2019-03-01';
# q23
select*from employee
where joining_date <'2019-03-31';
# q24
select now()as enrollment_date_time;
# q25
select now(3) as enrollment_date_time;
# q26
select employee.employee_id,datediff(employee.joining_date,reward.date_reward)
as date_difference
from employee
join reward
on employee.employee_id=reward.employee_ref_id;
# q27
select now() as current_date_time;
# q28
select first_name
from employee 
where first_name like'%/%%';
# q29
select replace(last_name,'-',' ')
as last_name
from employee;
# q30
select department, sum(salary)
as total_salary
from employee
group by department;