1. inserting a single row 

insert into student values (103,'Adi','adi@pirelli.com','',current_timestamp,'1999-01-01','adiadi','huawei')

select * from student where email like '%pir%';

-- insert these values as a new student , diploma field is NULL 
-- select the new entry from the student table, where the email includes pir 



2. inserting a single row with values in any order 

insert into student  (student_id,name,email,diploma,created_at,birth_date,username,password) values (104,'robin','will@me.com','chief inspector',current_timestamp,'2022-05-27','robinicawill','ilovetati');

-- insert the values in the order we named them 


3. adding multiple rows to a table 

insert into student (student_id, name, email,username)
values
    (105,'alex','alexica@com','alexique'),
    (106,'jenica','jean@eu','jenique'),
    (107,'vituca','nebun@el','vituque');

select * from student where email in ('alexica@com','jean@eu','nebun@el');

-- insert multiple values defined first by us 
-- check afterwards if inserted with this selection based on multiple values from email column,


4. updating all rows in a table  / update statement for all rows 

update student set created_at ='2023-04-17 21:14:00';

-- update all the created_at column on all rows 


5. update multiple columns in all rows 



Update specific rows 


6. an update statement for specific rows 

update student set created_at = '2023-01-01 00:01' where username = 'cespadero0';

-- updated the created_at column for that row where the username column was equal to param cesapdero0


7. update multiple columns for specific rows 

update student set email = 'cwhitwam0@test.com' , name = 'CourtTest' where username = 'cespadero0';

-- updated the email and name columns for the row that had username = our param 



Removing Data from ALL Rows in a Table 


8. to delete all rows from a table 

DELETE FROM student;

-- will delete all rows 



9. to delete specific rows from a table

delete from student where diploma is null;

-- deleted rows where diploma was null 




TRANSACTIONS 
-- a transaction is a set of rules and commands 
-- if one fails , the transaction is rolled back 
-- if all succeed, the transaction is commited 

10. switch autocommit off and begin a transaction


