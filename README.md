# database-library-system

## Title
Library Management System

## ERD
![Library Management System ERD](https://github.com/user-attachments/assets/5294a2d2-d3d3-4ba3-8581-1143f3cbbdaf)

## Description
A database project designed to manage the borrowing and returning of books by students.

## Technologies Used
DBMS PostgreSQL, SQL Queries.

## Database Schema Overview
* student: Stores student details such as student ID, name, and class.
* book: Stores book details such as book ID, title, author, and stock.
* borrowing: Stores borrowing transaction details including borrowing ID, student ID, book ID, borrowing date, status, and return date.

## Features:
* CRUD operations (Create, Read, Update, Delete) for student and book records.
* Track which books are currently borrowed or returned.
* Manually update stock when books are borrowed or returned.

## Sample Queries:
-- 1. Show all students who have borrowed books
    SELECT DISTINCT student.studentName
    FROM borrowing
    JOIN student ON borrowing.studentID = student.studentID;

-- 2. List all currently borrowed books and their borrowers
    SELECT student.studentName, book.bookName, borrowing.borrowingDate
    FROM borrowing
    JOIN student ON borrowing.studentID = student.studentID
    JOIN book ON borrowing.bookID = book.bookID
    WHERE borrowing.status = 'Borrowed';

-- 3. Count how many times each book has been borrowed
    SELECT book.bookName, COUNT(*) AS times_borrowed
    FROM borrowing
    JOIN book ON borrowing.bookID = book.bookID
    GROUP BY book.bookName;

## Setup Instructions:
* Clone this repository to your local machine and follow these instructions to set up the database.
* Includes:
  - Installation of PostgreSQL.
  - Running the SQL script to create the database and tables.
## Why I Built This
I created this database project as a way to implement what I’ve learned about databases. It also serves as part of my personal portfolio and is shared to encourage collaboration and learning with others.
    
## Author Info
Created by Shalama Qawlam Fadilla.
Feel free to reach out via Email (shalamaafadilla@gmail.com) or GitHub (@shalamaqf).
