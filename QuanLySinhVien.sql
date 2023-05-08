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
 
 
 insert into Class (ClassName,StartDate,Status) values ('A1','2008-12-20',1);
 insert into Class (ClassName,StartDate,Status) values ('A2','2008-12-22',1);
 insert into Class (ClassName,StartDate,Status) values ('B3',current_date,0);
 
 insert into Student (StudentID,StudentName,Address,Phone,Status,ClassID) values (1,'Hung','Ha noi','0912113113',1,1);
 insert into Student (StudentID,StudentName,Address,Phone,Status,ClassID) values (2,'Hoa','Hai Phong','',1,1);
 insert into Student (StudentID,StudentName,Address,Phone,Status,ClassID) values (3,'Manh','HCM','0123123123',0,2);
 
 insert into subject (SubName,Credit,Status) values ('CF',5,1);
 insert into subject (SubName,Credit,Status) values ('C',6,1);
 insert into subject (SubName,Credit,Status) values ('HDJ',5,1);
 insert into subject (SubName,Credit,Status) values ('RDBMS',10,1);
 
 insert into Mark (SubID,StudentID,Mark,ExamTimes) values (1,1,8,1);
 insert into Mark (SubID,StudentID,Mark,ExamTimes) values (1,2,10,2);
 insert into Mark (SubID,StudentID,Mark,ExamTimes) values (2,1,12,1);
 
 
 