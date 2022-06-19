DROP DATABASE IF EXISTS infostudents;
CREATE DATABASE infostudents;
USE infostudents;

CREATE TABLE student (
  student_id int NOT NULL,
  name varchar(10) NOT NULL,
  age int NOT NULL,
  gpa int NOT NULL,
  PRIMARY KEY (student_id)
);
INSERT INTO student VALUES (1,'Aleksandur', 12, 5);
INSERT INTO student VALUES (2,'nashko', 14, 5);
INSERT INTO student VALUES (3,'goshko', 12, 6);

CREATE TABLE grade (
  student_id int NOT NULL,
  name varchar(10) NOT NULL,
  math int NOT NULL,
  bg int NOT NULL,
  subd int NOT NULL,
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);
INSERT INTO grade VALUES (1,'Aleksandur', 3, 4, 6);
INSERT INTO grade VALUES (2,'nashko', 3, 5, 6);
INSERT INTO grade VALUES (3,'goshko', 6, 5, 6);

SELECT * FROM grade
WHERE name = 'Aleksandur';
SELECT * FROM grade
WHERE name LIKE '%a%';
SELECT * FROM grade
WHERE (math + bg)/2 > 5;
SELECT s.name, s.age, s.gpa 
FROM student s
JOIN grade g ON g.student_id = s.student_id
HAVING max(math);

SELECT s.name, g.math, g.bg, g.subd 
FROM student s
JOIN grade g ON g.student_id = s.student_id
WHERE s.gpa > 5;