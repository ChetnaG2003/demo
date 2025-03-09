TASK 1
create table employee_details (
EmployeeID serial primary key,
FirstName varchar not null,
LastName varchar not null,
Email varchar not null,
PhoneNumber bigint,
HireDate date,
Salary decimal(10,2) check(salary > 0),
DepartmentID int,
IsActive boolean default 'true',
JobTitle varchar
)

TASK 2
insert into employee_details values(1, 'Chetna', 'Gawai','chetnagawai1@gmail.com','9876543216','2024-01-11', 300000,1,'true','HR');
insert into employee_details values(2, 'Kajal', 'kale','kajalkale1@gmail.com','9876556216','2025-01-11', 4000000,2,'true','Finance');
insert into employee_details values(3, 'Trupti', 'Ingle','truptiingle1@gmail.com','9876543277','2024-02-11', 500000,3,'false','sale execu');
insert into employee_details values(4, 'Renna', 'Gharde','reenagharde21@gmail.com','3476543216','2024-01-13', 200000,4,'true','HR');
insert into employee_details values(5, 'Pragati', 'Rai','pragatirai2@gmail.com','9876543296','2025-01-11', 600000 ,5,'false','Finance');
select* from  employee_details 



TASK 3
copy employee_details from 'A:/employee_details.csv' delimiter ',' csv header;
select*from employee_details 

TASK 4
update  employee_details set Departmentid='0'where Isactive='false'


TASK 5
update employee_details set salary =salary * 1.08 where Isactive='false' and departmentid=0 and 
jobtitle in('HR Manager', 'Financial Analyst', 'Business Analyst', 'Data Analyst');


TASK 6
select  salary,firstname as name ,lastname as surnmae from employee_details where salary between 30000 and 50000; 


TASK 7
Select firstname from employee_details where firstname like 'A%';

TASK 8
SeleCt* from employee_details where employeeid between  1 and 5;


TASK 9
select  firstname as Name ,lastname as Surname from employee_details as employee_database;


TASK 10
alter table employee_details add column state varchar; 
alter table employee_details alter column state set not null;
update employee_details set state='india' where Isactive ='true';
update employee_details set state='usa' where Isactive ='false'







 

 

