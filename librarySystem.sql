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

-- select query to view student's table
select * from student;

-- insert values to book's table
insert into book(bookName, author, stock)
values('The Power of Habit', 'Charles Duhigg', 5),
      ('Deep Work', 'Cal Newport', 1),
      ('Atomic Habits', 'James Clear', 4),
      ('The 5 AM Club', 'Robin Sharma', 2),
      ('Outliers', 'Malcolm Gladwell', 3),
      ('To Kill a Mockingbird', 'Harper Lee', 2),
      ('How to Win Friends and Influence People', 'Dale Carnegie', 5),
      ('Attitude is Everything', 'Jeff Keller', 1),
      ('The Great Gatsby', 'F. Scott Fitzgerald', 3);

-- select query to view book's table
select * from book;

-- insert values to borrowing's table
insert into borrowing(studentID, bookID)
values(1, 2),
      (1, 5),
      (2, 3),
      (3, 9),
      (4, 6),
      (4, 1),
      (4, 3),
      (5, 7),
      (6, 8),
      (6, 9),
      (7, 4);

-- select query to view borrowing's table
select * from borrowing;