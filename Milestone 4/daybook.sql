CREATE TABLE if not exists student(
sID integer not null unique auto_increment,
fName varchar(40) not null,
lName varchar(40) not null,
email varchar(250) not null,
pwdID integer not null,
primary key (sID),
foreign key (pwdID));

INSERT INTO student (sID, fName, lName, email, pwdID) VALUES ("Bridget", "Smith", "bridget.smith@colorado.edu", (select pID from pwds where pID=pwdID));
INSERT INTO student (sID, fName, lName, email, pwdID) VALUES ("Reilly", "McGavern", "reilly.mcgavern@colorado.edu", (select pID from pwds where pID=pwdID));
INSERT INTO student (sID, fName, lName, email, pwdID) VALUES ("Nicole", "Richter", "nicole.richter@colorado.edu", (select pID from pwds where pID=pwdID));

CREATE TABLE if not exists pwds(
pID integer not null unique auto_increment,
pwdHash varchar(250)
primary key (pwdID));

#to join password ids from student_acct and pwds use this stmt
SELECT * FROM student 
INNER JOIN pwds 
ON student.pwdID = pwds.pID;

CREATE TABLE if not exists course(
courseID integer not null unique,
dept varchar(40),
courseNum integer not null,
primary key (courseID));

CREATE TABLE if not exists enrollment(
sID integer not null,
courseID integer not null,
foreign key (sID),
foreign key (courseID));

#to create a table with students enrolled in courses use this stmt
SELECT *
FROM student S
JOIN enrollment E 
ON S.sID=E.sID
JOIN course C 
ON C.courseID=E.courseID;

		