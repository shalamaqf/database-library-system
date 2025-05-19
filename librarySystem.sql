-- create an enum type for status
create type current_status as enum ('Borrowed', 'Returned'); 

-- create a table for student
create table student
(
    studentID serial not null PRIMARY KEY,
    studentName varchar (100) not null,
    studentClass char (4) not null
);

-- create a table for book
create table book
(
    bookID serial not null PRIMARY KEY,
    bookName varchar (100) not null,
    author varchar (100) not null,
    stock int not null,
    constraint check_book_stock check(stock >= 0)
);

