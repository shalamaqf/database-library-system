-- create an enum type for status
CREATE TYPE current_status AS enum ('Borrowed', 'Returned'); 

-- create a table for student
CREATE TABLE student
(
    studentID serial not null PRIMARY KEY,
    studentName varchar (100) not null,
    studentClass char (4) not null
);

-- create a table for book
CREATE TABLE book
(
    bookID serial not null PRIMARY KEY,
    bookName varchar (100) not null,
    author varchar (100) not null,
    stock int not null,
    CONSTRAINT check_book_stock CHECK(stock >= 0)
);

-- create a table for borrowing
CREATE TABLE borrowing
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
INSERT INTO student(studentName, studentClass)
VALUES('Jason', '10B'),
      ('Frod', '11A'),
      ('Rachel', '10A'),
      ('Emily', '12C'),
      ('Mike', '12B'),
      ('David', '11B'),
      ('Anne', '10C');

-- select query to view student's table
SELECT * FROM student;

-- insert values to book's table
INSERT INTO book(bookName, author, stock)
VALUES('The Power of Habit', 'Charles Duhigg', 5),
      ('Deep Work', 'Cal Newport', 1),
      ('Atomic Habits', 'James Clear', 4),
      ('The 5 AM Club', 'Robin Sharma', 2),
      ('Outliers', 'Malcolm Gladwell', 3),
      ('To Kill a Mockingbird', 'Harper Lee', 2),
      ('How to Win Friends and Influence People', 'Dale Carnegie', 5),
      ('Attitude is Everything', 'Jeff Keller', 1),
      ('The Great Gatsby', 'F. Scott Fitzgerald', 3);

-- select query to view book's table
SELECT * FROM book;

-- insert values to borrowing's table
INSERT INTO borrowing(studentID, bookID)
VALUES(1, 2),
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
SELECT * FROM borrowing;

-- manually decrease stock for borrowed books
-- use transaction to ensure all-or-nothing update
BEGIN;

UPDATE book SET stock = stock - 1 WHERE bookID = 2;
UPDATE book SET stock = stock - 1 WHERE bookID = 5;
UPDATE book SET stock = stock - 1 WHERE bookID = 3;
UPDATE book SET stock = stock - 1 WHERE bookID = 9;
UPDATE book SET stock = stock - 1 WHERE bookID = 6;
UPDATE book SET stock = stock - 1 WHERE bookID = 1;
UPDATE book SET stock = stock - 1 WHERE bookID = 3;
UPDATE book SET stock = stock - 1 WHERE bookID = 7;
UPDATE book SET stock = stock - 1 WHERE bookID = 8;
UPDATE book SET stock = stock - 1 WHERE bookID = 9;
UPDATE book SET stock = stock - 1 WHERE bookID = 4;

COMMIT;

-- manually update status and add returned date for returned books
-- use transaction to ensure all-or-nothing update
BEGIN;

UPDATE borrowing
SET status = 'Returned',
    returnDate = current_timestamp 
WHERE bookID = 5;

UPDATE borrowing
SET status = 'Returned',
    returnDate = current_timestamp 
where bookID = 4;

UPDATE borrowing
SET status = 'Returned',
    returnDate = current_timestamp 
WHERE bookID = 2;

COMMIT;

-- join query to joins student's and book's table in borrowing table
SELECT student.studentName, 
       book.bookName, 
       borrowing.status, 
       borrowing.borrowingDate,
       borrowing.returnDate
FROM borrowing
INNER JOIN student ON borrowing.studentID = student.studentID 
INNER JOIN book ON borrowing.bookID = book.bookID;