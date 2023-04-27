1. INNER JOIN - returns rows that match from both tables.

select  first_name ,last_name ,book_name
from students join books  on students.id = books.student_id

-- select those 3 columns from students and join book on students.id matches books.student_id
-- through our foreign key, declared on table books 
-- this returns the book names , first and last name of a book creator


select first_name,last_name,course_id
from students join enrollments e on students.id = e.student_id;

-- returns full student name for those who have enrollments


-- multiple joins

    select first_name,last_name,name,department
        from students  join enrollments e on students.id = e.student_id
            join courses c on c.id = e.course_id;
-- returns full name of student , name and department of course, where 
-- studens joins enrollments with foreign key student id 
-- and courses join enrollments where course id is foreign key in courses 



2. OUTER JOIN
//join student book  -->left arata si studentii care nu au carti
-->right arata cartile ce nu au studenti
-->full arata si


select name, department,first_name,last_name
        from courses join enrollments e on courses.id = e.course_id
            right join students s on s.id = e.student_id;

-- returns the full name of the students and the name and department
-- of the courses they joined 
-- where courses join enrollments right  join students 


?? cum putem impiedica dublu enrollments? trebuie sa fie unique? 
?? mai putem modifica enrollments table acum? 


alter table enrollments
    add constraint enrollments_pk
        unique (course_id, student_id);

-- modifica enrollments 
-- adauga constrangere enrollments_pk
-- unica din curs_id si studentd_id


-- trebuie creat un index pentru securitatea bazei
-- indexul mic

elevi fara carti 



select first_name,last_name,book_name
    from books right join students s on s.id = books.student_id;
--selecteaza toti studentii , si pe cei care au carti si pe cei care nu au carti 


select first_name,last_name,book_name
    from books left join students s on s.id = books.student_id;
-- selecteaza doar studentii care au carti 




select first_name,last_name,name
    from students join enrollments e on students.id = e.student_id
        left join courses c on e.course_id = c.id;
-- selecteaza student si nume curs pentru cei inrolati 



select first_name,last_name,name
    from students join enrollments e on students.id = e.student_id
        right join courses c on e.course_id = c.id;
-- selecteaza toate cursurile, si cele la care s-a inrolat cineva 
-- si cele la care nu s-a inrolat nimeni, 
-- si le dubleaza pe cele la care s-au inrolat mai multe persoane 



select first_name,last_name,name
    from courses join enrollments e on courses.id = e.course_id
        right join students s on s.id = e.student_id;
-- returns the list of students and course name for those who enrolled 
-- and will double the students who have more than one enrollment





select *
from students
join enrollments e on students.id = e.student_id;
-- will return all students that have enrollments




JOIN exercises

1. Retrieve all students who have enrolled in a course.

select first_name,last_name,email
from students
join enrollments e on students.id = e.student_id;

-- name , email 


2. Retrieve the books borrowed by a specific student.

select first_name,last_name,email
from students
join books b on students.id = b.student_id
where email='kmaffi5@fema.gov';

-- books borrowed by a specific student



3. Retrieve the courses that have no enrollments.

select department,name
from courses
left join enrollments e on courses.id = e.course_id
where e.id is null;

-- we are selecting courses by their id in enrollments table 
-- and  e.id is null to check if the course id is not present 


3.1 Retrieve the students that have no book.

select email
from students
left join books b on students.id = b.student_id
where b.id is null;
-- students is master table 
-- books is right table
-- tables merge and match and will check for rows in students table
-- that have NULL if the student id is not found in the books table


3.2 Retrieve students that have a book.
select distinct email
from students
left join books b on students.id = b.student_id
where b.id is not null;


4. Retrieve the student information along with the book details they have borrowed.


select students.id,students.first_name,students.last_name,students.email,b.book_name
from students
left join books b on students.id = b.student_id;

-- books joins students , where books.student_id is not present, a NULL is set for that row 
-- so all students are returned, no matter what 

where b.id is not null;

-- if we use this, it returns only the students that have a book, but with duplicates,
-- depending on how many rows the student_id is found in the books table 



5. Retrieve the courses that a specific student has enrolled in.
6. Retrieve the students who have not borrowed any books.
7. Retrieve the student information along with the course details they have enrolled in.
8. Retrieve the students who have borrowed a book more than once.
9. Retrieve the books borrowed by students who are older than 18 years.
10. Retrieve the students who have borrowed a book from a specific book name.
11. Retrieve the books borrowed by students who have enrolled in a specific course.
12. Retrieve the students who have not enrolled in any courses.
13. Retrieve the courses that have at least one enrollment.
14. Retrieve the students who have borrowed a book and also enrolled in a course.
15. Retrieve the books borrowed by students who have enrolled in a specific department's courses.
16. Retrieve the students who have borrowed books from a specific category of books.
17. Retrieve the courses that have no enrollments and have a department name starting with 'Math'.
18. Retrieve the students who have borrowed a book from a specific author.
19. Retrieve the courses that have enrollments from students who are younger than 25 years.
20. Retrieve the students who have borrowed a book and enrolled in a course with the same name.
21. Retrieve the books borrowed by students who have enrolled in courses with the same department name.
22. Retrieve the students who have borrowed a book and enrolled in courses with the same department name starting with 'Sci'.
23. Retrieve the books borrowed by students who have enrolled in courses offered by a specific department.
24. Retrieve the students who have borrowed a book and enrolled in courses offered by a specific department.
25. Retrieve the books borrowed by students who have enrolled in courses offered by a specific department and have a student ID card.
26. Retrieve the students who have borrowed a book and enrolled in courses with the same department name and have a student ID card.
27. Retrieve the courses that have enrollments from students who have not borrowed any books.
28. Retrieve the students who have borrowed books from more than one category of books.
29. Retrieve the courses that have enrollments from students who have borrowed books from a specific category of books.
30. Retrieve the students who have borrowed a book and enrolled in courses that have enrollments from students who are older than 20 years.
31. Retrieve the books borrowed by students who have enrolled in courses that have enrollments from students who have a student ID card.
32. Retrieve the students who have borrowed a book and enrolled in courses that have enrollments from students who have a student ID card and are older than 22 years.
33. Retrieve the courses that have no enrollments or have enrollments from students who have not borrowed any books.
34. Retrieve the students who have borrowed a book and enrolled in courses that have no enrollments or have enrollments from students who have not borrowed any books.
35. Retrieve the books borrowed by students who have enrolled in courses that have no enrollments or have enrollments from students who have not borrowed any books.
36. Retrieve the students who have borrowed a book and enrolled in courses that have enrollments from students who have a student ID card or are older than 18 years.
37. Retrieve the books borrowed by students who have enrolled in courses that have enrollments from students who have a student ID card or are older than 18 years.
38. Retrieve