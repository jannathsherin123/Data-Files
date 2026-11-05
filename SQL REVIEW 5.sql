create database jannath ;
use jannath;
create table loans(loan_id int,branch varchar(30),customer_name varchar(50),loan_amount int);
insert into loans(loan_id,branch,customer_name,loan_amount)
values(1,"kozhikode main","rajesh p",500000),
(2,"kozhikode main","sita devi",750000),
(3,"kochi branch","thomas k",300000),
(4,"kochi branch","uma shankar",620000);
select branch,max(loan_amount)as highest_loan from loans group by branch;

