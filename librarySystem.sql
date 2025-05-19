-- create a table for student
create table student
(
    studentID serial not null PRIMARY KEY,
    studentName varchar (100) not null,
    studentClass char (4) not null
);
