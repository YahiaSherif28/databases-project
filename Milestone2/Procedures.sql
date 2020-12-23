use GUCeraDB
go
create proc studentRegister
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50),
@gender bit, @address varchar(10)
as
insert into	Users values(@first_name, @last_name, @password, @gender, @email, @address);
declare @id int = SCOPE_IDENTITY(); 
insert into Student(id ,gpa) values (@id, 0)

-- Exec studentRegister 'omar', 'khair', '123', 'abc@gmail.com', 1, 'nowhere'

go
create proc InstructorRegister
@first_name varchar(20), @last_name varchar(20), @password varchar(20), @email varchar(50),
@gender bit, @address varchar(10)
as
insert into	Users values(@first_name, @last_name, @password, @gender, @email, @address);
declare @id int = SCOPE_IDENTITY(); 
insert into Instructor(id , rating) values (@id, 0);

 --Exec InstructorRegister 'abdo', 'khater', '123', 'abdo@gmail.com', 1, 'shrouq'

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
create proc AdminAcceptRejectCourse
    @adminId int,@courseId int
    as
    update Course
    set Course.adminId = @adminId
    ,Course.accepted = '1'
    where Course.id = @courseId

-- exec AdminAcceptRejectCourse 6,1

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

-- 4 As an instructor I am able to :

go 
create proc InstAddCourse 
@creditHours int, @name varchar(10), @price DECIMAL(6,2), @instructorId int as
-- check referential integrity
if exists(select * from Instructor where id = @instructorId)
begin
	insert into Course(creditHours, name, price, instructorId) 
	values(@creditHours, @name, @price, @instructorId)
	declare @courseId int = SCOPE_IDENTITY();
	insert into InstructorTeachCourse(instId, cid) values(@instructorId, @courseId)
end 

/*
exec InstAddCourse 2, db, 100, 7;
select * from Course 
select * from InstructorTeachCourse
*/


go
create proc UpdateCourseContent
@instrId int, @courseId int, @content varchar(20) as
-- only instructors teaching the course are allowed to change the content
if exists(select * from InstructorTeachCourse where instId = @instrId and cid = @courseId)
begin
	update Course 
	set content = @content
	where id = @courseId
end 

go
create proc UpdateCourseDescription
@instrId int, @courseId int, @courseDescription varchar(200) as
-- only instructors teaching the course are allowed to change the description
if exists(select * from InstructorTeachCourse where instId = @instrId and cid = @courseId)
begin
	update Course 
	set courseDescription = @courseDescription
	where id = @courseId
end 
/*
exec UpdateCourseContent 7, 1, 'course1.guc.edu.eg'
exec UpdateCourseDescription 7, 1, 'Theory of computation course'
select * from Course 
*/


go
create proc AddAnotherInstructorToCourse
@insid int, @cid int, @adderIns int as 
-- only the owner instructor is allowed to add other instructors
if exists(select * from Course where instructorId = @adderIns and id = @cid) and 
exists(select * from Instructor where id = @insid)
begin
	insert into InstructorTeachCourse(instId, cid) values(@insid, @cid)
end 

/*
exec AddAnotherInstructorToCourse 8, 1, 7;
select * from InstructorTeachCourse;
*/

go
create proc InstructorViewAcceptedCoursesByAdmin 
@instrId int as
select * from Course
where instructorId = @instrId and accepted = 1

-- exec InstructorViewAcceptedCoursesByAdmin 7 

go
create proc DefineCoursePrerequisites
@cid int , @prerequsiteId int as
if exists(select * from Course where id = @cid) and 
exists(select * from Course where id = @prerequsiteId)
begin
	insert into CoursePrerequisiteCourse(cid, prerequisiteId) values (@cid, @prerequsiteId)
end
/*
exec DefineCoursePrerequisites 1,2
select * from CoursePrerequisiteCourse;
*/


go
create proc DefineAssignmentOfCourseOfCertianType
@instId int, @cid int , @number int, @type varchar(10), @fullGrade int, @weight decimal(4,1), @deadline
datetime, @content varchar(200) as
if exists(select * from InstructorTeachCourse where instId = @instId and cid = @cid)
begin
	insert into Assignment(cid, number, type, fullGrade, weight, deadline, content)
	values(@cid, @number, @type, @fullGrade, @weight, @deadline, @content)
end
/*
exec DefineAssignmentOfCourseOfCertianType 7, 1, 1, 'quiz', 10, 2, '12/12/2020', 'question1'
select * from Assignment
*/

go 
create proc updateInstructorRate
@insid int as
if exists(select * from Instructor where id = @insid)
begin
	declare @curRate decimal(2,1)
	select @curRate = avg(rate) from StudentRateInstructor 
	where instId = @insid
	-- if there are no ratings set the value to zero
	if @curRate is null 
		set @curRate = 0
	update Instructor
	set rating = @curRate where id = @insid
end

/*
exec updateInstructorRate 7
select * from Instructor
*/

go
create proc ViewInstructorProfile
@instrId int as
exec updateInstructorRate @instrId 
select U.firstName, U.lastName, U.gender, U.email, U.address, I.rating, M.mobileNumber
from Instructor I inner join Users U on I.id = U.id 
left outer join UserMobileNumber M on I.id = M.id
where I.id = @instrId

-- exec ViewInstructorProfile 7


go
create proc InstructorViewAssignmentsStudents
@instrId int, @cid int as
-- check if this instructor is teaching this course
if exists(select * from InstructorTeachCourse where instId = @instrId and cid = @cid)
	select * from StudentTakeAssignment where cid = @cid 

-- exec InstructorViewAssignmentsStudents 7, 1

go
create proc InstructorgradeAssignmentOfAStudent
@instrId int, @sid int , @cid int, @assignmentNumber int, @type varchar(10), @grade decimal(5,2) as
-- check if this instructor is teaching this student this course and the Assignment exists 
declare @fullGrade int
select @fullGrade = fullGrade
from Assignment 
where cid = @cid and number = @assignmentNumber and type = @type

if exists(select * from StudentTakeCourse where instId = @instrId and sid = @sid and cid = @cid) and
exists(select * from Assignment where cid = @cid and number = @assignmentNumber and type = @type) and
@grade >= 0 and @grade <= @fullGrade
-- insert or update???????????
begin
	insert into StudentTakeAssignment(sid, cid, assignmentNumber, assignmentType, grade)
	values(@sid, @cid, @assignmentNumber, @type, @grade)
end

go
create proc ViewFeedbacksAddedByStudentsOnMyCourse
@instrId int, @cid int as
select number, comments, numberOfLikes from Feedback where cid = @cid

-- exec ViewFeedbacksAddedByStudentsOnMyCourse 7,2

go
create proc calculateFinalGrade
@cid int, @sid int, @insId int as

-- final grade = sum(STA.grade/A.fullGrade)*A.weight
declare @finalGrade decimal(10,2)
select @finalGrade = sum(IsNull(STA.grade, 0)*A.weight/A.fullGrade)
from Assignment A left outer join StudentTakeAssignment STA 
-- left outer join to show the assignments that the student didn't take
on A.cid = STA.cid and A.number = STA.assignmentNumber and A.type = STA.assignmentType 
where A.cid = @cid and (STA.sid = @sid or STA.sid is null)

update StudentTakeCourse
set grade = @finalGrade 
where sid = @sid and cid = @cid and instId = @insId


-- exec calculateFinalGrade 1,5,7

/*
select * from Assignment
select * from Course
insert into Assignment values(1,2,'quiz', 10, 98, '12/12/2020', 'Qustions')
select * from StudentTakeCourse
insert into StudentTakeCourse(sid, instId, cid) values(5,7,1)
select * from StudentTakeAssignment
exec InstructorgradeAssignmentOfAStudent 7,5,1,1,'quiz', 9.2  
exec InstructorgradeAssignmentOfAStudent 7,5,1,2,'quiz', 5  
*/

go
create proc InstructorIssueCertificateToStudent
@cid int , @sid int , @insId int, @issueDate datetime as
-- A certificate can be issued only one time
if not exists(select * from StudentCertifyCourse where sid = @sid and cid = @cid)
begin
	exec calculateFinalGrade @cid, @sid, @insId 
	declare @finalGrade decimal(10,2)
	select @finalGrade = grade from StudentTakeCourse 
	where sid = @sid and cid = @cid and instId = @insId
	if @finalGrade is not null and @finalGrade >= 50  -- passed the course
		insert into StudentCertifyCourse(sid, cid, issueDate) values (@sid, @cid, @issueDate)
end
/*
exec InstructorIssueCertificateToStudent 1, 5, 7, '10/10/2021'
select * from StudentCertifyCourse
*/

go
create proc viewPromocode
@sid int as
select * from Promocode where @sid =adminId


/*insert into	Users values('a', 'b', '123', 1, 'asd', 'asd');
declare @id int = SCOPE_IDENTITY();
insert into admin(id ) values (@id)

select * from admin
exec AdminCreatePromocode '123',2020 ,2021,1.2,1
exec viewPromocode 1*/

go
create proc payCourse
@cid INT, @sid INT as
if exists (select * from StudentTakeCourse where @cid = cid and @sid = sid)
begin
     update StudentTakeCourse
    set StudentTakeCourse.payedfor = '1'
    where StudentTakeCourse.cid = @cid and StudentTakeCourse.sid = @sid
end

go
create proc enrollInCourseViewContent
@id int , @cid int as
if exists (select * from StudentTakeCourse where @id = sid and @cid = cid )
begin
    select * from course where @cid =id
end


go
create proc viewAssign
@courseid int, @sid int as
if exists(select * from StudentTakeCourse where @courseid = cid and @sid = sid)
begin
    select * from Assignment where @courseid = cid
end


go
create proc submitAssign
@assignType VARCHAR(10), @assignnumber int, @sid INT, @cid INT as
if exists(select * from StudentTakeCourse where @cid = cid and @sid = sid)
begin
    insert into	StudentTakeAssignment values(@sid, @cid, @assignnumber, @assignType, 0.0);
end

go
create proc viewAssignGrades
@assignnumber int, @assignType VARCHAR(10), @cid INT, @sid INT , @assignGrade INT output as
select grade from StudentTakeAssignment where @cid = cid and @sid = sid and @assignnumber = assignmentNumber and @assignType = assignmentType

go
create proc viewFinalGrade
@cid INT, @sid INT , @finalgrade decimal(10,2) as
select grade from StudentTakeCourse where @cid = cid and @sid =sid

go
create  proc addFeedback
@comment VARCHAR(100), @cid INT, @sid INT as
if exists(select * from StudentTakeCourse where @cid = cid and @sid = sid )
begin
    insert into Feedback(cid ,comments,sid) values (@cid, @comment,@sid)
end

go
create proc rateInstructor
@rate DECIMAL (2,1), @sid INT, @insid INT as
if exists(select * from StudentTakeCourse where @insid = instId and @sid = sid )
begin
insert into StudentRateInstructor values (@sid, @insid, @rate)
end

go
create proc viewCertificate
@cid INT, @sid INT as
select * from StudentCertifyCourse where sid= @sid and cid = @cid

