CREATE DATABASE library;

USE library;

-- Table books
CREATE TABLE books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    published_year INT,
    PRIMARY KEY (book_id)
);

-- Members book
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    join_date DATE,
    PRIMARY KEY (member_id)
);

-- Borrowed books
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    PRIMARY KEY (borrow_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Insert Sample Data into books Table
INSERT INTO books (title, author, published_year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('To Kill a Mockingbird', 'Harper Lee', 1960),
('1984', 'George Orwell', 1949);

-- Insert Sample Data into members Table
INSERT INTO members (first_name, last_name, join_date) VALUES
('John', 'Doe', '2025-01-01'),
('Jane', 'Smith', '2025-02-01'),
('Alice', 'Johnson', '2025-03-01');

-- Insert Sample Data into borrowed_books Table
INSERT INTO borrowed_books (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2025-02-15', '2025-02-22'),
(2, 2, '2025-02-20', '2025-02-27'),
(3, 3, '2025-03-01', NULL);

-- Selecting database
SELECT * FROM books;

SELECT * FROM members;

SELECT bb.borrow_id, b.title, m.first_name, m.last_name, bb.borrow_date, bb.return_date
FROM borrowed_books bb
JOIN books b ON bb.book_id = b.book_id
JOIN members m ON bb.member_id = m.member_id;
