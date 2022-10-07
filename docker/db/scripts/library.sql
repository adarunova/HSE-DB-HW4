CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO arunova_203;

\connect library

CREATE TABLE publisher (
  id int PRIMARY KEY,
  name varchar,
  address varchar
);


CREATE TABLE book (
  isbn int PRIMARY KEY,
  title varchar,
  author varchar,
  year int,
  publisher_id int NOT NULL,
  pages_number int
);

CREATE TABLE book_copy (
  id int PRIMARY KEY,
  position int,
  isbn int NOT NULL
);

CREATE TABLE reader (
  id int PRIMARY KEY,
  firstname varchar,
  lastname varchar,
  address varchar,
  birth_date date
);

CREATE TABLE category (
  id int PRIMARY KEY,
  name varchar,
  parent_category int NOT NULL
);

CREATE TABLE book_category (
  id int PRIMARY KEY,
  isbn int NOT NULL,
  category_id int NOT NULL
);

CREATE TABLE borrow_book (
  id int PRIMARY KEY,
  reader_id int NOT NULL,
  book_copy_id int NOT NULL,
  return_date date
);

ALTER TABLE category ADD FOREIGN KEY (parent_category) REFERENCES category (id);
ALTER TABLE book ADD FOREIGN KEY (publisher_id) REFERENCES publisher (id);
ALTER TABLE book_copy ADD FOREIGN KEY (isbn) REFERENCES book (isbn);
ALTER TABLE borrow_book ADD FOREIGN KEY (book_copy_id) REFERENCES book_copy (id);
ALTER TABLE borrow_book ADD FOREIGN KEY (reader_id) REFERENCES reader (id);
ALTER TABLE book_category ADD FOREIGN KEY (isbn) REFERENCES book (isbn);
ALTER TABLE book_category ADD FOREIGN KEY ("category_id") REFERENCES category (id);