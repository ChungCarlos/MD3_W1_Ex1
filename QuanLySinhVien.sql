create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
ClassID int primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
Status bit);

create table Student(
StudentID int primary key,
StudentName varchar(30) not null,
Address varchar(50) not null,
Phone varchar(20),
Status bit,
ClassID int not null);

create table Subject(
 SubID int primary key auto_increment not null,
 SubName varchar(30) not null,
 Credit tinyint not null default 1 check(Credit>=1),
 Status bit default 1);
 
 create table Mark(
 MarkID int not null primary key auto_increment,
 SubID int not null,
 StudentID int not null,
 Mark float default 0 check (Mark between 0 and 100),
 ExamTimes tinyint default 1);
 alter table Mark
 add unique (SubID, StudentID);
 alter table Mark
 add foreign key(SubID) REFERENCES Subject(SubID),
 add FOREIGN KEY (StudentId) REFERENCES Student (StudentId);
 alter table Class
 modify StartDate date;
 
 
 insert into Class (ClassName,StartDate,Status) 
 values ('A1','2008-12-20',1),
		('A2','2008-12-22',1),
		('B3',current_date,0);
 
 insert into Student (StudentID,StudentName,Address,Phone,Status,ClassID)
 values (1,'Hung','Ha noi','0912113113',1,1),
		(2,'Hoa','Hai Phong','',1,1),
		(3,'Manh','HCM','0123123123',0,2);
 
 insert into subject (SubName,Credit,Status) 
 values ('CF',5,1),
		('C',6,1),
		('HDJ',5,1),
		('RDBMS',10,1);
 
 insert into Mark (SubID,StudentID,Mark,ExamTimes)
 values (1,1,8,1),
		(1,2,10,2),
		(2,1,12,1);
 
 SELECT *
FROM Student;

SELECT *
FROM Student
WHERE Status = true;

SELECT *
FROM Subject
WHERE Credit < 10;
 
 SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’--
select * from Student where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12 --
select class.ClassName, class.StartDate
from class
where month(class.StartDate)  >= 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5 --
select * from subject
where Credit >=3 and Credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2 --
update student set ClassID = 2
where StudentName like '%Hung';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.StudentName, subject.SubName, mark.Mark
from mark
join student on student.StudentID = mark.StudentID
join subject on subject.SubID = mark.SubID
order by mark.Mark desc, student.StudentName asc;