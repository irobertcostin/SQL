create database online_school_db;

use online_school_db;


create table students(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
  first_name VARCHAR(50) NOT NULL ,
  last_name VARCHAR(50) NOT NULL ,
  email VARCHAR(70) UNIQUE NOT NULL,
  age INT NOT NULL
);

create table books(
    id  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    student_id INT NOT NULL ,
    book_name VARCHAR(70) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (student_id) REFERENCES students(id)

);




create table  student_id_cards(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    student_id INT NOT NULL ,
    card_number VARCHAR(25) UNIQUE NOT NULL ,
    FOREIGN KEY  (student_id) REFERENCES students(id)
);


create table courses (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);


create table enrollments(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL ,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL ,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)

);


-- generated with mockaroo
insert into students (first_name, last_name, email, age) values ('Ashlen', 'Chaffyn', 'achaffyn0@cnn.com', 42);
insert into students (first_name, last_name, email, age) values ('Lacie', 'Iggulden', 'liggulden1@lulu.com', 48);


-- generated with mockaroo
insert into courses (name, department) values ('XOMA Corporation', 'Health Care');


-- generated with mockaroo
insert into books (book_name, student_id) values ('Learning to Ride', 92);


-- constraint for no same enrollments
alter table enrollments
    add constraint enrollments_pk
        unique (course_id, student_id);

-- avoid duplicate emails/registrations

ALTER TABLE students
ADD CONSTRAINT students_email_unique
UNIQUE (email);


--dropped the above modification, because it was a duplicate index
drop index students_email_unique on students;


-- a default timestamp forgot to add it 
ALTER TABLE books
MODIFY COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- add a default timestamp for enrollments also 
ALTER TABLE enrollments
MODIFY COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;



-- our students table did not have a password column 
ALTER TABLE students
ADD COLUMN password VARCHAR(100) NOT NULL;




-- security improvements for passwords

update students
set password ='NewPassword123'
where length(password) <8
    or not REGEXP_LIKE(password,'[[:digit:]]')
        or not REGEXP_LIKE(password,'[[:upper:]]');






