create table employees(EMPNO INT primary key,ENAME varchar(50),JOB varchar(50),MGR INT,HIREDATE date,SAL INT,COMM INT,DEPTNO INT);
insert into employees(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
values(7369,"SMITH","CLERK",7902,"1980-12-17",800,null,20),
(7499,"ALLEN","SALESMAN",7698,"1981-02-20",1600,300,30),
(7521,"WARD","SALESMAN",7698,"1981-02-22",1250,500,30),
(7566,"jones","MANAGER",7839,"1981-04-02",2975,NULL,20),
(7654,"MARTIN","SALESMAN",7698,"1981-09-28",1250,1400,30),
(7698,"BLAKE","MANAGER",7839,"1981-05-01",2850,NULL,30),
(7782,"CLARK","MANAGER",7839,"1981-06-09",2450,NULL,10),
(7788,"SCOTT","ANALYST",7566,"1987-04-19",3000,NULL,20),
(7839,"KING","PRESIDENT",NULL,"1981-11-17",5000,NULL,10),
(7844,"TURNER","SALESMAN",7698,"1981-09-08",1500,0,30),
(7876,"ADAMS","CLERK",7788,"1987-05-23",1100,NULL,20),
(7900,"JAMES","CLERK",7698,"1981-12-03",950,NULL,20),
(7902,"FORD","ANALYST",7566,"1981-12-03",3000,NULL,20),
(7934,"MILLER","CLERK",7782,"1982-01-23",1300,NULL,10);

select*from employees;


select*from employees;
select EMPNO,ENAME,SAL from employees;

select*from employees;
select distinct job from employees;
select EMPNO,SAL*12 as annual_salary from employees;
select*from employees where DEPTNO=10;
select*from employees where job="clerk";
select*from employees where ENAME like "s%";
select*from employees where ENAME like"_1%";
select*from employees where ENAME like"%ar%";
select*from employees where year(HIREDATE)=1981;
select ENAME,SAL from employees where SAL>2500;
select*from employees where job!="manager";
select*from employees where COMM is not null;
select*from employees where MGR is null;
select ENAME from employees where DEPTNO=30 and job="salesman";
select ENAME from employees where job in ("clerk","analysts");
select ENAME from employees where SAL between 1000 and 2000;


select lower(ENAME)from employees;

select char_length(ENAME) from employees as stringlength;

select mod(sal,1000)from employees;
select now();
select year(HIREDATE)from employees;
select monthname(HIREDATE)from employees;
select ENAME,2025-year(HIREDATE) as year from employees;


create table department(DEPTNO INT primary key,DNAME varchar (20),loc varchar(20));
insert into department(DEPTNO,DNAME,LOC)
values(10,"accounting","newyork"),
(20,"RESEARCH","DALLAS"),
(30,"SALES","CHICAGO"),
(40,"operations","boston");
select*from department;

alter table department add column PINCODE int;
select*from department;

insert into department(DEPTNO,DNAME,LOC)
values(50,"HR","HOUSTON"); 

set sql_safe_updates=0;
 update department  
 set loc="atlanta"
 where DNAME="sales";
 select*from department;
 
 delete from department
 where Dname="operations";
 select*from department;