select*from employees;

select job,avg(sal) as average_salary from employees
group by job;

select job,count(*)from employees
group by job;

select job,min(sal) from employees
group by job;

select job,avg(sal)from employees
group by job having job !="president"
order by avg(sal) desc;

select*from employees
where sal>2500;

select*from employees
where sal>
(select avg (sal)from employees);

select*from employees
where job!="president" and 
sal>
(select avg (sal) from employees where job!="president");

update employees set sal=4500 where empno=7788;

delete from employees where empno=7900;

create table emp(employees_id INT PRIMARY KEY,employees_name VARCHAR(50),department_id int,salary int,joining_date DATE);
insert into emp(employees_id,employees_name,department_id,salary,joining_date)
values(1,'Arun',101,65000,'2023-01-15'),
(2,'Rahul',101,48000,'2023-03-10'),
(3,'Anjali',101,72000,'2021-07-20'),
(4,'Vishnu',102,55000,'2022-06-12'),
(5,'Meera',102,42000,'2023-02-18'),
(6,'Fahad',102,68000,'2021-11-05'),
(7,'Sneha',103,50000,'2022-08-25'),
(8,'Ravi',103,45000,'2024-01-10'),
(9,'Akhil',104,60000,'2022-12-10'),
(10,'Neha',104,52000,'2023-09-01'),
(11,'Nikhil',108,47000,'2022-12-10'),
(12,'Diya',115,58000,'2021-04-22');

select*from department;

select e.employees_name,e.salary,d.department_name from emp e
inner join department d 
on e.department_id=d.department_id;

select e.employees_name,e.salary,d.department_name from emp e
left join department d 
on e.department_id=d.department_id;

select e.employees_name,e.salary,d.department_name from emp e
right join department d 
on e.department_id=d.department_id;


#full

select e.employees_name,e.salary,d.department_name from emp e
left join department d 
on e.department_id=d.department_id
union
select e.employees_name,e.salary,d.department_name from emp e
right join department d 
on e.department_id=d.department_id;

create table customer(cust_id int primary key,cust_name varchar(25),city varchar(25),country varchar(25));
select*from customer;
create	table store(store_id varchar(10) primary key, store_name varchar(100));
select*from store;
create table category(cat_id varchar(10) primary key,cat_name varchar(100));
select*from category;
create table product(product_id varchar(10)primary key,product_name varchar(100),cat_id varchar(10),unit_price decimal(10,2),unit_cost decimal(10,2),foreign key (cat_id) references category(cat_id));
select*from product;
create table orders(orders_id int primary key,order_date date,cust_id int,product_id varchar(10),store_id varchar(10),quantity int,
foreign key(cust_id)references customer(cust_id),
foreign key(product_id) references product(product_id),
foreign key (store_id) references store(store_id));

select*from orders;

select*from emp;
select employees_id,employees_name,department_id,salary,row_number()over(partition by department_id order by salary desc) as row_num from emp;

select*from emp;
select employees_id,employees_name,department_id,salary,rank()over(partition by department_id order by salary desc) as emp_rank from emp;

select  employees_id,employees_name,department_id,salary,dense_rank()over(partition by department_id order by salary desc) as emp_rank from emp;

select employees_id,employees_name,department_id,salary,lag(salary,1,0)over(partition by department_id order by salary desc)as previous_salary from emp;

select employees_id,employees_name,department_id,salary,lead(salary,1,0)over(partition by department_id order by salary desc)as future_salary from emp;

 select employees_id,employees_name,department_id,salary,lead(salary,2,0)over(partition by department_id order by salary desc)as future_salary from emp;

create view employee_tenure as select employees_id as id,employees_name as ename, timestampdiff(year,joining_date,curdate()) as tenure from emp;


select*from employee_tenure;

create table emplo(empit serial primary key,name varchar(25),department varchar(20),salary int,joiningdate date);
insert into emplo(name,department,salary,joiningdate)
 values('alice smith','Hr',50000.00,'2023-02-24'),
('Bob johnson','Hr',55000.00,'2023-01-02'),
('charlie brown','Hr',60000.00,'2022-05-30'),
('emma watson','It',65000.00,'2022-05-25'),
('franklin adams','It',70000.00,'2021-11-15');

select*from emplo;

create table emplologs(id int,name varchar(50),department varchar(50));
select*from emplologs;

 delimiter $$
create trigger before_insertion before insert on emplo for each row
 begin
 set
 new.joiningdate=current_date(); 
 end$$ 
 delimiter ;
 
 delimiter $$
create trigger log_insertion after insert on emplo for each row
begin
     insert into emplologs(id,name,department_name)
      values(new.empit,new.name,new.department);
      end$$
      delimiter ;
      
select*from emp_new;
create table emplologs(id int,
 name varchar(25),
department_name varchar(20)
);
    
    drop trigger log_insertion;
    delimiter $$

CREATE TRIGGER log_insertion
AFTER INSERT ON emplo
FOR EACH ROW
BEGIN
   INSERT INTO emplologs(id,name,department)
	VALUES(NEW.empit,NEW.name,NEW.department);
END$$
DELIMITER ;

drop trigger log_insertion;

INSERT INTO emplo(name,department,salary,joiningdate)
values('john','IT',20000.00,'2024-01-06');

select*from emp_new;

select*from emplologs;

delimiter //
create procedure emp_det(in x int)
begin
select*from emplo where empit=x;
end//
delimiter ;

call emp_det(1);
  
drop  procedure emp_det;

delimiter //
create procedure dept_emp(in dept_id int)
begin
select*from emplo where department=department;
end//
delimiter ;

call  dept_emp(1);

delimiter //
create procedure avg_salary(in dept varchar(25),out avg_salary decimal) 
begin
 select avg(salary)into avg_salary from emplo
 where department=department;
 end//
 delimiter ;
 
 call avg_salary("Hr",@hr_avg_sal);
 call avg_salary("It",@It_avg_sal);
 
 select@hr_avg_sal;
 select@It_avg_sal;
 
 delimiter //
 create trigger log_deletion
 after delete on emplo
 for each row
 begin
 delete from emplologs
 where id=old.empit;
 end //
 delimiter ;
 
 delimiter //
 create trigger log_update
 after update on emplo
 for each row
 begin
 insert into emplologs
 values(old.empit,'update');
 end//
 delimiter ;
 
 delete from emplo
 where empit=23;
 
 select* from emplologs;
 