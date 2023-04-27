

-- create a database named mycode 
create database mycode;

-- use the mycode database
USE mycode; 



-- create a table named student 
-- student ID is an integer, 
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(40) ,
    email VARCHAR(40) ,
    diploma VARCHAR(40),
    created_at TIMESTAMP DEFAULT NOW() ,
    birth_date DATE  ,
    username VARCHAR(40) UNIQUE  NOT NULL,
    password VARCHAR(40)

);




1.

```
SELECT * FROM <table name>;

```

select * from student 
-- will select all columns from student 


2. retrieve specific columns of info
```
SELECT <column name> FROM <table name>; 
```

select  username  from student;
-- selects the username column from student, along with the primary key


3. retrieve multiple columns 
```
SELECT <column name 1>, <column name 2>, ... FROM <table name>;
```

select  email ,diploma from student; 
-- will select columns email and diploma from the table



4. aliasing column names 

SELECT  birth_date AS  bday from student;
-- will select the birth_date column and reproduce it under 
-- another name, the ALIAS


5. finding the data you want 

SELECT name FROM student WHERE name='Gib'; 
-- will return only that student where the condition is met 

6. equality operator

SELECT * FROM student WHERE diploma='Koshien University';
-- will select all entries where the diploma equals our param


7. inequality operator

SELECT * FROM student WHERE diploma!='Koshien University';
-- will select all entries where the diploma is different than our choice 


8. other relational operators 

< , <= , > , >= 

SELECT * FROM student where birth_date<= "1992-11-29";
-- will return entries where birthdate is less or equal than


select diploma from student where birth_date > '1994-01-01'
-- will return the diplomas from each entry where the birth date is greater than chosen 



select name from student where diploma='Koshien University' AND username='mmitchely1t';
-- will return the name of the entries where diploma equals our multiple conditions 



9. searching in a set of values 

select name from student where diploma in ('Koshien University','Kurume University');
-- will return the names of the students where diploma is constructed from multiple choice

select username from student where name in ('Mikaela', 'Kris', 'Leta', 'Jacob');
-- will return the usernames where the name is as our choice 

select name from student where username not in ('lsaura2','jattoc4','mmitchely1t','ktatterton1');
-- will select only the name of the students that are not included in our choice 




10. searching within a range of values 

select name from student where birth_date BETWEEN  '1994-01-01' AND '1994-05-05';
-- will return only the student names where the birth date is between our values 


-- check regex for passwords and email accounts string identifiers 
-- also check javascript match method 

11. pattern matching 

Placing the percent symbol (`%`) any where in a string in conjunction with the `LIKE` keyword will operate as a wildcard. Meaning it can be substituted by any number of characters, including zero!

select email from student where email like '%@%oo%';

-- will return the emails from students where the email contains @ , and two oo , with wildcards everywhere else



12. missing values 

select * from student where email is not null;
-- will return every entry where email is not null 















