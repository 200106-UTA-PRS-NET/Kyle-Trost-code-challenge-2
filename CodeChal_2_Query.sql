create schema CodeChallenge2
go

-- Department
create table CodeChallenge2.Department
(
	deptId int Identity(1, 1) primary key,
	deptName varchar(max) not null,
	deptLoc varchar(max) not null
)

insert into CodeChallenge2.Department values('Sales', 'Arlington_TX')
insert into CodeChallenge2.Department values('Human Resources', 'Arlington_TX')
insert into CodeChallenge2.Department values('R&D', 'Arlington_TX')
insert into CodeChallenge2.Department values('Marketing', 'Arlington_TX')
select * from CodeChallenge2.Department

delete CodeChallenge2.Department
truncate table CodeChallenge2.Department

-- Employee
create table CodeChallenge2.Employee
(
	empId int Identity(1, 1) primary key,
	fName varchar(max) not null,
	lName varchar(max) not null,
	deptId int foreign key references CodeChallenge2.Department(deptId)
)

insert into CodeChallenge2.Employee values('Kyle', 'Trost', 1)
insert into CodeChallenge2.Employee values('John', 'Doe', 2)
insert into CodeChallenge2.Employee values('Jane', 'Doe', 3)
insert into CodeChallenge2.Employee values('Tina', 'Smith', 4)
insert into CodeChallenge2.Employee values('Fred', 'Douglas', 4)
select * from CodeChallenge2.Employee

select * from CodeChallenge2.Employee where deptId = 4

select count(*) from CodeChallenge2.Employee where deptId = 1
select count(*) from CodeChallenge2.Employee where deptId = 2
select count(*) from CodeChallenge2.Employee where deptId = 3
select count(*) from CodeChallenge2.Employee where deptId = 4

delete CodeChallenge2.Employee
truncate table CodeChallenge2.Employee

-- EmpDetails
create table CodeChallenge2.EmpDetails
(
	detailsId int Identity(1, 1) primary key,
	empId int foreign key references CodeChallenge2.Employee(empId),
	salary money not null,
	address1 varchar(max) not null,
	address2 varchar(max),
	city varchar(max) not null,
	state varchar(max) not null,
	country varchar(max) not null
)

insert into CodeChallenge2.EmpDetails values(1, 70000, 'address1', 'address2', 'city', 'state', 'country')
insert into CodeChallenge2.EmpDetails values(2, 70000, 'address1', 'address2', 'city', 'state', 'country')
insert into CodeChallenge2.EmpDetails values(3, 70000, 'address1', 'address2', 'city', 'state', 'country')
insert into CodeChallenge2.EmpDetails values(4, 70000, 'address1', 'address2', 'city', 'state', 'country')
insert into CodeChallenge2.EmpDetails values(5, 70000, 'address1', 'address2', 'city', 'state', 'country')

select * from CodeChallenge2.EmpDetails

--select sum(salary) from CodeChallenge2.EmpDetails
	--where empId = (select empId from CodeChallenge2.Employee where deptId = (select deptId from CodeChallenge2.Department where deptName = 'Marketing'))

--select sum(salary) from CodeChallenge2.EmpDetails
	--where (select deptId from CodeChallenge2.Employee) = 4

update CodeChallenge2.EmpDetails set salary = 90000 where empId = (select empId from CodeChallenge2.Employee where fName = 'Tina' and lname = 'Smith')
