select id, "name", email, "password", created_on
from public.students;

--1. Print all fields and all rows
select* FROM students;
--2. Print all students in the table
select * from students;
--3. Print only Users Id
select "id" from students;
--4. Print user name only
select "name" from students;
--5. Print user email only
select "email" from students;
--6. Print the name and email of the users
select "name", "email" from students;
--7. Print id, name, email, and user creation date
select "id", "name", "email", created_on
from students;
--8. Print users where password 12333
select * from students
where password like '%12333%';
--9. Print users who were created 2021-03-26 00:00:00:00
select * from students
where created_on in ('2021-03-26 00:00:00');
--10. Print users where in the name has the word Anna
select * from students
where name like 'Anna%';
--11. Print users where in the end of the name is 8
select * from students
where name like '%8'; 
-- 12. Print users where the name in has a letter 'a'
select * from students
where name like '%a%';
-- 13. Print all users who were created 2021-07-12 00:00:00:00
select * from students 
where created_on in ('2021-07-12 00:00:00');
-- 14. Select users who were created 2021-07-12 00:00:00:00 and have a password of 1m313
select * from students 
where created_on = '2021-07-12 00:00:00' and password like '1m313';
-- 15. Select users who were created 2021-07-12 00:00:00 and who have the word Andrey in their name
select * from students 
where created_on = '2021-07-12 00:00:00' and name like 'Andrey%';
-- 16. Select users who were created 2021-07-12 00:00:00 and who have the number 8 in the name
select * from students 
where created_on = '2021-07-12 00:00:00' and name like '%8%';
-- 17. Print out a user whose id is 110
select * from students 
where "id" = 110;
-- 18. Print the user of which id is 153
select * from students 
where "id" = 153;
-- 19. Print user with id greater than 140
select * from students 
where "id" > 140;
-- 20. Print the user with id less than 130
select * from students 
where "id" < 130;
-- 21. Print the user with id less than 127 or greater than 188
select * from students 
where "id" < 127 or "id" > 188;
-- 22. Print a user whose id is less than or equal to 137
select * from students 
where "id" < 137 or "id" = 137;
-- 23. Print a user whose id is greater than or equal to 137
select * from students 
where "id" > 137 or "id" = 137;
-- 24. Print a user with id greater than 180 but less than 190
select * from students 
where "id" > 180 and "id" < 190;
-- 25. Print user id between 180 and 190
select * from students 
where "id" between 180 and 190;
-- 26. Print users where the password is 12333, 1m313, 123313
select * from students 
where "password" in ('12333', '1m313', '123313');
-- 27. Output users where created_on is 2020-10-03 00:00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00:00:00
select * from students 
where created_on in ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');
-- 28. Print minimum id
select * from students
order by "id" ASC;
 --29. Print max id
select * from students
order by "id" DESC;
-- 30. Print the number of users
select count (id) from students;
-- 31. Print the user id, username, and user creation date. Sort in order of adding a date of the user.
select "id", "name", created_on
from students
order by created_on ASC;
-- 32. Print the user id, username, and user creation date. Sort in descending order of date of adding the user.
select "id", "name", created_on
from students
order by created_on DESC;

