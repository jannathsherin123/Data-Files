create database jannath;
use jannath;
create table employee(employeeID INT primary key,Name VARCHAR(25),dept VARCHAR(25),salary INT,age INT);
insert into employee(employeeID,Name,dept,salary,age)
values(1,"fidha","finance",20000,25);
select*from employee;

insert into employee
values(2,"ridha","HR",30000,28),
(3,"mirfana","DA",25000,27),
(4,"sherin","accounting",15000,22),
(5,"lameea","CA",50000,40);
select*from employee;

create table movies(ID INT primary key,NAME VARCHAR(25) unique,genre varchar(25) NOT NULL,Rating float,industry VARCHAR(15),Released_year INT);
insert into movies(ID,NAME,GENRE,RATING,INDUSTRY,RELEASED_YEAR)
values(1,"anjaam pathiraa","thriller",8.1,"mollywood",2020),
(2,"premalu","romantic",9.5,"mollywood",2024),
(3,"home","family",8.8,"mollywood",2021),
(4,"kumbalangi nights","family",9.5,"mollywood",2019),
(5,"jaya jaya jaya jaya hey","family",7.6,"mollywood",2022),
(6,"sudani from nigeria","family",8.2,"mollywood",2018),
(7,"meri zindagi hai tu","romantic",9.5,"lollywood",2025),
(8,"baahubali","action",5.5,"tollywood",2014);
select*from movies;
alter table movies add column director varchar(25);
alter table movies rename column director to writer;
alter table movies modify released_year float;

select*from movies
where industry="mollywood";

select*from movies
where rating>5;

select*from movies
where released_year between 2010 and 2020;




create table dept(department_id INT primary key,department_name varchar(50),location varchar(50));
insert into dept(department_id,department_name,location)
values(101,"IT","kerala"),
(102,"sales","kerala"),
(103,"HR","karnataka"),
(104,"finance","tamil nadu"),
(105,"marketing","kerala");

insert into dept(department_id,department_name,location)
values
(106,"DA","karnataka");
select*from dept;

create table emp(employee_id int primary key,employee_name varchar(100),department_id int,salary decimal(10,2),joining_date DATE);
INSERT INTO emp(EMPLOYEE_ID,EMPLOYEE_NAME,DEPARTMENT_ID,SALARY,JOINING_DATE)
VALUES
(1,'ARUN',101,65000,'2022-01-15'),
(2,'RAHUL',101,48000,'2023-03-10'),
(3,'ANJALI',101,72000,'2021-07-20'),
(4,'VISHNU',102,55000,'2022-06-12'),
(5,'MEERA',102,42000,'2023-02-18'),
(6,'FAHAD',102,68000,'2021-11-05'),
(7,'SNEHA',103,45000,'2024-01-10'),
(8,'RAVI',103,45000,'2024-01-10'),
(9,'AKHIL',104,60000,'2020-05-15'),
(10,'NEHA',104,52000,'2023-09-01'),
(11,'NIKHIL',105,47000,'2022-12-10'),
(12,'DIYA',105,58000,'2021-04-22');
select*from emp;

INSERT INTO emp(EMPLOYEE_ID,EMPLOYEE_NAME,DEPARTMENT_ID,SALARY,JOINING_DATE)
values
(13,"jannath",201,10000,"2021-06-23"),
(14,"sherin",111,20000,"2022-07-24");
select*from emp;

alter table emp rename column empolyee_name to employee_name;


CREATE TABLE PROJECTS(PROJECT_ID INT PRIMARY KEY,PROJECT_NAME VARCHAR(100),DEPARTMENT_ID INT,BUDGET DECIMAL(12,2));
INSERT INTO PROJECTS(PROJECT_ID,PROJECT_NAME,DEPARTMENT_ID,BUDGET)
VALUES
(201,'WEBSITE DEVELOPMENT',101,500000),
(202,'MOBILE APPLICATION',101,750000),
(203,'SALES EXPANSION',102,300000),
(204,'RECRUITMENT DRIVE',103,150000),
(205,'FINANCIAL AUDIT',104,250000);
select*from projects
where salary>
(select round(avg(salary),2)as average_sal from emp);

select*from employees
where salary>
(select max(salary)from employees
where department_id=103);

select department_id from department
where location="kerala";

select*from employees;

		 