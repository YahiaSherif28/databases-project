use GUCeraDB
go
create proc studentRegister
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50),
@gender bit, @address varchar(10)
as
insert into	Users values(@first_name, @last_name, @password, @gender, @email, @address);
declare @id int
SELECT @id = SCOPE_IDENTITY(); 
insert into Student(id ,gpa) values (@id, 0) 

-- Exec studentRegister 'omar', 'khair', '123', 'abc@gmail.com', 1, 'nowhere'

go
create proc InstructorRegister
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50),
@gender bit, @address varchar(10)
as
insert into	Users values(@first_name, @last_name, @password, @gender, @email, @address);
declare @id int
SELECT @id = SCOPE_IDENTITY(); 
insert into Instructor(id , rating) values (@id, 0);

 Exec InstructorRegister 'abdo', 'khater', '123', 'abdo@gmail.com', 1, 'shrouq'

go
create proc userLogin 
@ID int, @password varchar(20), @Success bit output, @Type int output as
if exists(select * from Users where id = @ID and password = @password)
begin
	set @Success = 1
	if exists(select * from Instructor where id = @ID)
		set @Type = 0;
	else if exists(select * from Admin where id = @ID)
		set @Type = 1;
	else if exists(select * from  Student where id = @ID)
		set @Type = 2;
	else
		set @Type = -1;
end
else
begin
	set @Success = 0;
	set @Type = -1;
end
/*
declare @success bit, @type int;
exec userLogin 7, '123', @Success output, @Type output;
print @success;
print @type;
*/

go 
create proc addMobile
@ID int, @mobile_number varchar(20) as
if exists(select * from Users where id = @ID)
	insert into UserMobileNumber(id, mobileNumber) values (@ID, @mobile_number)

/*
Exec addMobile 7, '0123456789'
select * from UserMobileNumber;
*/

go
create proc AdminListInstr as
select * from Instructor inner join Users on Instructor.id = Users.id

-- Exec AdminListInstr

go
create proc AdminViewInstructorProfile
@instrId int
as
    select * from Instructor inner join Users on Instructor.id = Users.id
    where Instructor.id = @instrId

-- Exec AdminViewInstructorProfile 5

go
create proc AdminViewAllCourses as
    select * from Course

-- Exec AdminViewAllCourses

go
create proc AdminViewNonAcceptedCourses as
    select * from Course
    where accepted = '0';

-- Exec AdminViewNonAcceptedCourses

go
create proc AdminViewCourseDetails
    @courseId int
    as
    select * from Course
    where id = @courseId

-- Exec AdminViewCourseDetails 1

go
create proc AdminCreatePromocode
    @code varchar(6), @issueDate datetime, @expiryDate datetime, @discount decimal(4,2), @adminId int
    as
    insert into Promocode values (@code, @issueDate, @expiryDate, @discount, @adminId)

-- EXEC AdminCreatePromocode '123456','20201222','20201222','24',6

go
create proc AdminListAllStudents as
    select * from Users inner join Student on Users.id = Student.id

-- exec AdminListAllStudents

go
create proc AdminViewStudentProfile
    @sid int
    as
    select * from Users inner join Student on Users.id = Student.id
    where Student.id = @sid

-- exec AdminViewStudentProfile 7

go
create proc AdminIssuePromocodeToStudent
    @sid int, @pid varchar(6)
    as
    insert into StudentHasPromocode values (@sid, @pid)

-- exec AdminIssuePromocodeToStudent 1,'123456'

