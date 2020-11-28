
create schema mini;

create table position1(
	PositionID varchar(20) primary key,
    PosDesc varchar(20));
    
create table department(
	DeptID varchar(20) primary key,
    DeptName varchar(20),
    Location varchar(20),
    ManagerID varchar(20)
    );
        
    
create table qualification(
	QualID varchar(20) primary key,
    QualDesc varchar(20));
    
create table emplevel(
	LevelNo varchar(20) primary key,
    EmployeeID varchar(20),
    Lowsalary varchar(20),
    Highsalary varchar(20));

create table dependent(
	DependentID varchar(20) primary key,
	EmployeeID varchar(20),
    DependentDOB varchar(20),
    Relation varchar(20));
	

    
create table employee(
	EmployeeID varchar(20) primary key,
    Lname varchar(20),
    Fname varchar(20),
    PositionID varchar(20),
    QualID varchar(20),
    DeptID varchar(20),
	Salary varchar(20),
    Commission varchar(20),
    HireDate varchar(20),
    BirthDate varchar(20),
    DependentID varchar(20));
    
create table empvalid(
		EmployeeID varchar(20) primary key,
        Emppass varchar(20));
        
        
create table hrvalid(
		HrID varchar(20) primary key,
        Hrpass varchar(20));
        
alter table department add foreign key(ManagerID) references employee(EmployeeID) on delete set null;
alter table dependent add foreign key(EmployeeID) references employee(EmployeeID);    
alter table employee add foreign key(PositionID) references position1(PositionID) on delete set null;
alter table employee add foreign key(QualID) references qualification(QualID) on delete set null;
alter table employee add foreign key(DeptID) references department(DeptID) on delete set null;
alter table emplevel add foreign key(EmployeeID) references employee(EmployeeID);
alter table employee add foreign key(DependentID) references dependent(DependentID) on delete set null;
alter table emplevel drop column TotalSal;

select * from position1;
select * from qualification;
select * from emplevel;
select * from department;
select * from dependent;
select * from employee;
select * from empvalid;
select * from hrvalid;
select * from empvalid;


delimiter $$
create trigger trig1 
after update on employee
for each row
begin
declare summ int;
set summ=new.Salary+new.Commission;
update emplevel set Highsalary=((summ-Highsalary)+Highsalary) where new.EmployeeID=EmployeeID;
end
$$

delimiter $$
create procedure proc1(in empid int)
select e.EmployeeID,e.Lname,e.Fname,e.HireDate,e.BirthDate,e.Salary,e.Commission,p.PosDesc,
d.DeptName,q.QualDesc,dep.Relation from Employee e,position1 p,department d,qualification q,
dependent dep where e.PositionID=p.PositionID and e.QualID=q.QualID and
 e.DependentID=dep.DependentID and e.DeptID=d.DeptID and e.EmployeeID=empid;
$$
call proc1(100);

delimiter $$
create trigger trig2
before insert on emplevel
for each row
begin
if(new.Lowsalary<10000) then
set new.Lowsalary=10000;
end if;
end $$

delimiter $$
create procedure proc2(in did int)
select * from department where DeptId=did;
$$
call proc2(12);

