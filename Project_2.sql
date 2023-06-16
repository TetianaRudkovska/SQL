--Create table employees
create table employees(
	id serial  primary key,
	employee_name varchar(50)  not null
);
--Insert into table 'employee' 70 rows
INSERT INTO employees(employee_name)
values ('Joshua Hill'),
    ('Francisco Harris'),
    ('Tripp Anderson'),
    ('Colton Sanders'),
    ('Watson Torres'),
    ('Francisco Adams'),
    ('Zackary Butler'),
    ('Marco Phillips'),
    ('Cesar Gonzalez'),
    ('Yahya Rogers'),
    ('Anthony Richardson'),
    ('Henley Wright'),
    ('Luka Hernandez'),
    ('Esteban Moore'),
    ('Whitelaw White'),
    ('Ziyad Sanders'),
    ('Harlyn Jones'),
    ('Wilson Henderson'),
    ('Karter Parker'),
    ('Samuel Miller'),
    ('Lionel Campbell'),
    ('Uri Taylor'),
    ('Ronan Watson'),
    ('Houston Bryant'),
    ('Titus Coleman'),
    ('Cash Foster'),
    ('Whitelaw Price'),
    ('Luka Sanders'),
    ('Vinson Cox'),
    ('Braxton Howard'),
    ('Ishmael Coleman'),
    ('Xanthus Harris'),
    ('Hamza Smith'),
    ('Franco Nelson'),
    ('Colin Campbell'),
    ('Yosef Gray'),
    ('Yoshiaki Johnson'),
    ('Kieran Washington'),
    ('Hayes Diaz'),
    ('Ricardo Wood'),
    ('Umer Howard'),
    ('Mark Mitchell'),
    ('Conner Brooks'),
    ('Nevin Lee'),
    ('Derek Cook'),
    ('Orin Washington'),
    ('Rhett Powell'),
    ('Vlasta Jones'),
    ('Peter Turner'),
    ('Francisco Jenkins'),
    ('Miguel Edwards'),
    ('Zakari Phillips'),
    ('Valentin Bailey'),
    ('Samir Hughes'),
    ('Princeton Anderson'),
    ('Nikhil Phillips'),
    ('Solomon Rogers'),
    ('Landon Ross'),
    ('Simon Baker'),
    ('Nick Bennett'),
    ('Izaiah Hall'),
    ('Jeremiah Henderson'),
    ('Gunner Flores'),
    ('Emiliano Brown'),
    ('Damon Ross'),
    ('Theodore Perry'),
    ('Zane Richardson'),
    ('Grey Perez'),
    ('Boston Evans'),
    ('Ty Coleman');


drop table employees;
select * from employees;

create table salary(
id serial  primary key,
monthly_salary int not null
);

--Insert into table 'salary' 15 rows
insert into salary(monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500),
		(2600),
		(2700);
		

drop table salary;
select * from salary;

--Create table 'employee_salary'
create table employee_salary(
 id serial  primary key,
 employee_id  int not null unique,
 salary_id int not null
);

--Insert into 'employee_salary' 40 rows
insert into employee_salary(employee_id,salary_id)
values  (71,1),
		(72,2),
		(73,3),
		(74,4),
		(75,5),
		(76,6),
		(77,7),
		(78,8),
		(79,9),
		(80,10),
		(1,1),
		(2,2),
		(3,3),
		(4,4),
		(5,5),
		(6,6),
		(7,7),
		(8,8),
		(9,9),
		(10,10),
		(11,11),
		(12,12),
		(13,13),
		(14,14),
		(15,15),
		(16,16),
		(17,1),
		(18,2),
		(19,3),
		(20,4),
		(21,5),
		(22,6),
		(23,7),
		(24,8),
		(25,9),
		(26,10),
		(27,11),
		(28,12),
		(29,13),
		(30,14);
		

select * from employee_salary;
drop table employee_salary;


--Create table 'roles'
create table roles(
id serial primary key,
role_name int not null unique
);

--Change column type 'role_name' from int to varchar(30)
alter table roles   
alter column role_name type varchar(30);

--Insert into table 'roles' 20 rows
insert into roles(role_name)
values ('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');
		
		
drop table roles;
select * from roles;

--Create table 'roles_employee'
create table roles_employee(
 id serial primary key,
 employee_id int not null, 
 role_id int not null,
 foreign key (employee_id)
 references employees(id),
 foreign key (role_id)
 references roles(id)
);

--Insert into table 'roles_employee' 40 rows 
insert into roles_employee(employee_id,role_id)
values  (70,2),
		(18,3),
		(2,6),
		(11,4),
		(30,2),
		(4,9),
		(14,7),
		(67,10),
		(5,11),
		(12,6),
		(6,4),
		(40,6),
		(55,15),
		(62,12),
		(66,14),
		(53,15),
		(57,9),
		(34,8),
		(32,8),
		(36,9),
		(37,9),
		(38,10),
		(39,11),
		(23,1),
		(24,2),
		(25,3),
		(26,4),
		(27,5),
		(28,6),
		(29,7),
		(33,3),
		(15,8),
		(17,15),
		(44,5),
		(68,6),
		(59,7),
		(69,3),
		(51,8),
		(7,15);



select * from roles_employee;
drop table roles_employee;



select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

--1. Select all the employees whose salaries are in the database, along with the salaries.
select employee_name, monthly_salary
from employees join employee_salary
on employees.id = employee_id
join salary 
on salary_id = salary.id;

-- 2. Select all the employees whose salary are lower than 2000
select employee_name, monthly_salary
from employees join employee_salary
on employees.id = employee_id
join salary 
on salary_id = salary.id
where monthly_salary < 2000;

-- 3. Select all salary positions, but the employee is not assigned to them. (Salary there is, but it is unclear who receives it.)
select monthly_salary
from employee_salary
join salary 
on salary_id = salary.id
left join employees on employees.id = employee_id
where employee_name is null;

select monthly_salary from employees 
right join employee_salary
on employees.id=employee_salary.employee_id
right join salary
on salary.id=employee_salary.salary_id
where employees.id is null;

-- 4. Select all salary positions under 2000, but no employee has been appointed. (Salary there is, but it is unclear who receives it.)
select monthly_salary from employees 
right join employee_salary
on employees.id=employee_salary.employee_id
right join salary
on salary.id=employee_salary.salary_id
where monthly_salary < 2000 and employee_name is null;

-- 5. Find all employees who haven’t been select salary.
select employees.employee_name, employee_salary.salary_id 
from employee_salary right join employees on employee_salary.employee_id=employees.id
where salary_id is null;

-- 6. Select all employees with job titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id;

select * from roles_employee;

-- 7. Select Java Developer only name and titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Java developer%');

-- 8. Select Python Developer only name and titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Python developer%');

-- 9. Select QA Engineer only name and titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like ('%QA engineer%');

-- 10. Select Manual QA Engineer only name and titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Manual QA engineer%');

-- 11. Select Automation QA Engineer only name and titles.
select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Automation QA engineer%');

-- 12. Select names and salaries of Junior specialists.
select employees.employee_name, salary.monthly_salary, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employee_salary.employee_id = employees.id
join salary on salary.id = employee_salary.salary_id
where role_name like ('%Junior%');

-- 13. Select names and salaries of Middle specialists.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary join salary 
on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Middle%');

-- 14. Select names and salaries of Senior specialists.
select employees.employee_name, roles.role_name, salary.monthly_salary 
from salary join employee_salary 
on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Senior%'); 

-- 15. Select salary Java Developers.
select roles.role_name, salary.monthly_salary 
from employee_salary join salary 
on employee_salary.salary_id = salary.id 
join employees on employees.id = employee_salary.employee_id 
join roles_employee on roles_employee.role_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Java%');

-- 16. Select salary Python Developers.
select roles.role_name, salary.monthly_salary 
from employees join employee_salary 
on employees.id = employee_salary.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Python%');

-- 17. Select names and salaries of Junior Python Developers.
select roles.role_name, salary.monthly_salary 
from employees join employee_salary 
on employees.id = employee_salary.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Junior Python developer%');

-- 18. Select names and salaries of Middle JS Developers.  
select roles.role_name, salary.monthly_salary 
from employees join employee_salary 
on employees.id = employee_salary.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Middle JavaScript developer%');

-- 19. Select names and salaries of Senior Java Developers.
select roles.role_name, salary.monthly_salary 
from employees join employee_salary 
on employees.id = employee_salary.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Senior Java developer%');

-- 20. Select salary Junior QA Engineers
select roles.role_name, salary.monthly_salary 
from employees join employee_salary 
on employees.id = employee_salary.id 
join salary on salary.id = employee_salary.salary_id 
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles.id = roles_employee.role_id 
where role_name like ('%Junior QA engineer%');

-- 21. Select the average salary of all Junior specialists

select avg (salary.monthly_salary) as avg_salary from roles 
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%Junior%');

-- 22. Select JS Developer Salary Amount

select sum (salary.monthly_salary) as sum_salary from roles 
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%JavaScript developer%');

-- 23. Select the minimum salary QA engineer
select min (salary.monthly_salary) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%QA engineer%');

-- 24. Select the maximum salary QA engineer
select max (salary.monthly_salary) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%QA engineer%');

-- 25. Select the number of QA engineers
select count (roles.role_name) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%QA engineer%');

-- 26. Select the number of Middle specialist.
select count (roles.role_name) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%Middle%');

-- 27. Select Developers count
select count (roles.role_name) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%developer%');

-- 28. Select the fund (amount) of Developers' salaries.
select sum (salary.monthly_salary) from roles
join roles_employee on roles_employee.role_id = roles.id 
join employees on employees.id = roles_employee.role_id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on salary.id = employee_salary.salary_id 
where role_name like ('%developer%');

-- 29. Select the names, positions and salaries of all the specialists in increasing order Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
order by monthly_salary asc;


-- 30. Select the names, positions and salaries of all the specialists with a salary from 1700 to 2300 in increasing order Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
where monthly_salary >=1700 and monthly_salary <= 2300
order by monthly_salary asc;

-- 31. Select the names, positions and salaries of all the specialists with a salary less than 2300 Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
where monthly_salary < 2300
order by monthly_salary asc;

-- 32. Select the names, positions and salaries of all the specialists which have an salary of 1100, 1500, 2000  Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary from employees 
join roles_employee on employees.id = roles_employee.employee_id 
join roles on roles_employee.role_id = roles.id 
join employee_salary on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;