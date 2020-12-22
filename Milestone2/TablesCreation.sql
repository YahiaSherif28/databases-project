create database GUCeraDB
go
use GUCeraDB
create table Users(
id int primary key identity,
firstName varchar(20),
lastName varchar(20),
password varchar(20),
gender bit,
email varchar(50),
address varchar(10)
);

create table Instructor(
id int foreign key references Users on delete cascade on update cascade,
rating decimal(2,1),
primary key(id)
);

create table UserMobileNumber(
id int foreign key references Users on delete cascade on update cascade,
mobileNumber varchar(20),
primary key(id, mobileNumber)
);

create table Student(
id int foreign key references Users on delete cascade on update cascade,
gpa decimal(10,2) -- derived attribute -> add the equation
primary key(id)
);

create table Admin(
id int foreign key references Users on delete cascade on update cascade,
primary key(id)
);

create table Course(
id int primary key identity,
creditHours int,
name varchar(10),
courseDescription varchar(200),
price decimal(6,2),
content varchar(20),
adminId int foreign key references Admin on delete cascade on update cascade,
instructorId int foreign key references Instructor on delete NO ACTION on update NO ACTION,
accepted bit
);

create table Assignment(
cid int foreign key references Course on delete cascade on update cascade,
number int,
type varchar(10),
fullGrade int,
weight decimal(4,1),
deadline datetime,
content varchar(200),
primary key(cid, number, type)
);


create table Feedback(
cid int foreign key references Course on delete cascade on update cascade,
number int identity,
comments varchar(100),
numberOfLikes int,
sid int foreign key references Student on delete NO ACTION on update NO ACTION,
primary key(cid, number)
);

create table Promocode(
code varchar(6) primary key,
issueDate datetime,
expiryDate datetime,
discount decimal(4,2),
adminId int foreign key references Admin on delete cascade on update cascade,
);

create table StudentHasPromocode(
sid int foreign key references Student on delete cascade on update cascade,
code varchar(6) foreign key references Promocode on delete NO ACTION on update NO ACTION,
primary key(sid, code)
);

create table CreditCard(
number varchar(15) primary key,
cardHolderName varchar(16),
expiryDate datetime,
cvv varchar(3)

);

create table StudentAddCreditCard(
sid int foreign key references Student on delete cascade on update cascade,
creditCardNumber varchar(15) foreign key references CreditCard on delete cascade on update cascade,
primary key(sid, creditCardNumber)
);

create table StudentTakeCourse(
sid int foreign key references Student on delete cascade on update cascade,
cid int foreign key references Course on delete NO ACTION on update NO ACTION,
instId int foreign key references Instructor on delete NO ACTION on update NO ACTION,
payedfor bit,
grade decimal(10,2)
primary key(sid, cid, instId)
);

create table StudentTakeAssignment(
sid int foreign key references Student on delete cascade on update cascade,
cid int,
assignmentNumber int,
assignmentType varchar(10),
grade decimal(10,2),
primary key(sid, cid, assignmentNumber, assignmentType, grade),
foreign key(cid, assignmentNumber, assignmentType) references Assignment(cid, number, type) on delete NO ACTION on update NO ACTION
);


create table StudentRateInstructor(
sid int foreign key references Student on delete cascade on update cascade,
instId int foreign key references Instructor on delete NO ACTION on update NO ACTION,
rate decimal(2,1),
primary key(sid, instId)
);

create table StudentCertifyCourse(
sid int foreign key references Student on delete cascade on update cascade,
cid int foreign key references Course on delete NO ACTION on update NO ACTION,
issueDate datetime,
primary key(sid, cid)
);

create table CoursePrerequisiteCourse(
cid int foreign key references Course on delete cascade on update cascade,
prerequisiteId int foreign key references Course on delete NO ACTION on update NO ACTION,
primary key(cid, prerequisiteId)
);

create table InstructorTeachCourse(
instId int foreign key references Instructor on delete cascade on update cascade,
cid int foreign key references Course on delete NO ACTION on update NO ACTION,
primary key(instId, cid)
);

-- drop database Milestone2;

-- EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
-- EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"

-- SELECT * FROM information_schema.tables;