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
 