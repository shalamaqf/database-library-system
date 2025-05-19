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
    CONSTRAINT check_book_stock check(stock >= 0)
);

-- create a table for borrowing
create table borrowing
(
    borrowingID serial not null PRIMARY KEY,
    studentID int not null,
    bookID int not null,
    borrowingDate TIMESTAMP not null default current_timestamp,
    status current_status not null default 'Borrowed',
    returnDate TIMESTAMP,
    CONSTRAINT fk_student FOREIGN KEY (studentID) REFERENCES student(studentID) ON DELETE CASCADE,
    CONSTRAINT fk_book FOREIGN KEY (bookID) REFERENCES book(bookID)
);

-- insert values to student's table
insert into student(studentName, studentClass)
values('Jason', '10B'),
      ('Frod', '11A'),
      ('Rachel', '10A'),
      ('Emily', '12C'),
      ('Mike', '12B'),
      ('David', '11B'),
      ('Anne', '10C');

-- select queries to view student's table
select * from student;