create database QuanLyBanHang
character set utf8mb4
collate utf8mb4_general_ci;
use QuanLyBanHang;

create table Customer(
cID int not null primary key auto_increment,
cName varchar(20),
cAge int);

create table Oder(
oID int not null primary key auto_increment,
cID int not null,
unique (cID),
oDate datetime,
oTotalPrice float,
foreign key (cID) references Customer(cID));

create table OderDetail(
oID int not null,
pID int not null,
unique(oID,pID),
odQTY varchar(40),
foreign key (oID) references Oder(oID),
foreign key (pID) references Product(pID));

create table Product(
pID int not null primary key auto_increment,
pName varchar(48),
pPrice float);

insert into quanlybanhang.customer values(1,'Chung',23);
insert into quanlybanhang.customer values(2,'Hung',18);
insert into quanlybanhang.Oder values(1,1,'1995-10-10;',200);
insert into quanlybanhang.Oder values(2,2,'1993-10-10',160);
alter table Oder
modify column oDate date;
insert into quanlybanhang.Product values(1,'Công',120);
insert into quanlybanhang.Product values(2,'Tuấn',150);
insert into quanlybanhang.Product (pName,pPrice) values('Tuấn',150);

insert into quanlybanhang.OderDetail values(1,1,'Fucking');
insert into quanlybanhang.OderDetail values(2,2,'Holly Shit');

select sum(oTotalPrice)  from Oder;
select Customer.cName, Customer.cAge, Oder.oTotalPrice
from Customer
join Oder
on Customer.cID = Oder.cID;

-- EX [Bài tập] Thao tác với CSDL Quản lý bán hàng --

-- Them du lieu --
insert into Customer (cName,cAge) 
values ('Minh Quan',11),
('Ngoc Anh',20),
('Hong Ha',50);

insert into oder (cID, oDate, oTotalPrice) 
values (6,'2006-03-21',default);

insert into Product (pName,pPrice) 
values ('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into oderdetail (oID,pID,odQTY) 
values (16,1,3);

-- Hiển thị số lượng sinh viên ở từng nơi --
select Address, count(studentid) as SoLuong
from student
group by Address;

-- Tính điểm trung bình các môn học của mỗi học viên --
select student.StudentID, student.StudentName, avg(mark)
from student
join mark on student.StudentID = mark.StudentID
group by student.StudentID,student.StudentName;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15 --
select student.StudentID, student.StudentName, avg(mark)
from student
join mark on student.StudentID = mark.StudentID
group by student.StudentID,student.StudentName
having avg(mark) > 8;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.--
select student.StudentID, student.StudentName, avg(mark) as DTB_Max
from student
join mark using(StudentID)
group by student.StudentID,student.StudentName
having avg(mark) >=  all(select avg(mark) from mark);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất --
select SubName, max(Credit) as `Max Score`
from subject
group by SubName
order by max(Credit) asc;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất. --
select subject.SubName, max(mark.Mark) as `Max Score`
from subject
join mark on subject.SubID = mark.MarkID
group by subject.SubName;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần --
select student.StudentID, student.StudentName, avg(mark) as DTB
from student
join mark using(StudentID)
group by student.StudentID
order by avg(mark) desc;