create user main with password '123321'; 
 
create database dz5 with owner main; 
 
create table tutors( 
 id serial primary key, 
 name varchar(20), 
 surname varchar(20) 
); 
 
create table groups( 
 id serial primary key, 
 number varchar(20), 
 tutor_id int references tutors(id) 
); 
 
create table student( 
 id serial primary key, 
 name varchar(20),  
 birthday date, 
 group_id int references groups(id) 
); 

 
create table course( 
 id serial primary key, 
 name varchar(256), 
 hourse int, 
 price int 
); 
 
create table tutors_course( 
 id serial primary key, 
 tutor_id int references tutors(id), 
 course_id int references course(id) 
); 
 
INSERT INTO tutors 
(name, surname)  
VALUES  
('Екатерина', 'Ковалева'), 
('Андрей', 'Ильин'), 
('София', 'Королева'), 
('Максим', 'Соколов'); 
 
INSERT INTO groups 
(number, tutor_id)  
VALUES 
('ПВ211', 1), 
('Питон321', 4), 
('ПВ212', 3), 
('Питон322', 2); 

insert into student (name,birthday,group_id) values ('Edmond',  '1990-07-05',2);
insert into student (name, birthday group_id) values ('Vasya',   '1996-10-17',2);
insert into student (name, birthday, group_id) values ('Andrew', '1996-07-07', 2);
insert into student (name, birthday, group_id) values ('Alexey', '1995-07-19', 2);
insert into student (name, birthday, group_id) values ('Kate',  '1999-03-31', 2);
insert into student (name, birthday, group_id)values('Randy R', '2003-06-26', 2);
insert into student(name, birthday,group_id) values ('Sokol','2023-08-18', 2);


select name from student where group_id=2;

select student.name from student, tutors where student.group_id=2 and tutors.name='Максим';

select tutors.name , student.name from student, tutors where tutors.name ='София';

select tutors.name, groups.number from tutors, groups where groups.tutor_id=tutors.id;

select tutors.name,tutors_course.course_id, course.name from tutors,tutors_course,course where tutors_course.tutor_id = tutors.id and tutors_course.course_id = course.id;