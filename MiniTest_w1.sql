create database mini_test;
use mini_test;
create table Classes(
Id int not null primary key auto_increment,
Name varchar(40),
Language varchar(40),
Description varchar(40));

create table Address(
Id int not null primary key auto_increment,
Address varchar (40));

create table Students(
Id int not null primary key auto_increment,
Fullname varchar(40),
Address_id int not null,
age int,
phone varchar(20),
unique(phone),
Classes_id int not null,
foreign key (Address_id) references Address(id),
foreign key (Classes_id) references Classes(id));

create table Course(
Id int not null primary key auto_increment,
Name varchar (40),
Description varchar(40));

create table Point(
Id int not null primary key auto_increment,
Course_id int not null,
Student_id int not null,
Point float,
foreign key (Course_id) references Course (Id),
foreign key (Student_id) references Students(Id));

-- Thêm 5 bản ghi trong bảng Address --
insert into Address (Address) values('Nam Dinh');
insert into Address (Address) values('Thai Binh');
insert into Address (Address) values('Ha Noi');
insert into Address (Address) values('Hung Yen');
insert into Address (Address) values('Ha Nam');

-- Thêm 5 bản ghi trong bảng course --
insert into Course (Name,Description) values('Primary','in 1 month');
insert into Course (Name,Description) values('Intermediate 1','in 2 month');
insert into Course (Name,Description) values('Intermediate 2','in 2 month');
insert into Course (Name,Description) values('Advanced 1','in 3 month');
insert into Course (Name,Description) values('Advanced 2','in 3 month');

-- Thêm 5 bản ghi trong bảng Classes --
insert into Classes (Name,Language,Description) values('EngLish','EngLish','EngLish for everyone');
insert into Classes (Name,Language,Description) values('Korean','Korean','Korean for everyone');
insert into Classes (Name,Language,Description) values('Japanese','Japanese','Japanese for everyone');
insert into Classes (Name,Language,Description) values('Chinese','Chinese','Chinese for everyone');
insert into Classes (Name,Language,Description) values('Spanish','Spanish','Spanish for everyone');

-- Thêm 10 bản ghi trong bảng Students --
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Tran Van Chung',1,23,'0969969415',1);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Nguyen Van Anh',2,18,'0123456789',2);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Pham Minh Trieu',3,18,'0987654321',3);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Nguyen Van Tuan',4,19,'0123123456',4);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Nguyen Minh Cong',5,20,'0999222333',5);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Dao Van Tu',1,25,'0123666444',1);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Pham Tu Anh',2,21,'0945333777',2);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Tran Thi Trang',3,23,'0969969969',3);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Nguyen Mai Trang',4,18,'0944567897',5);
insert into Students (Fullname,Address_id,age,phone,Classes_id) values('Mai Thu Thao',5,18,'0933234666',4);

-- Thêm 15 bản ghi trong bảng Point --
insert into Point (Course_id,Student_id,Point) values(1,1,9);
insert into Point (Course_id,Student_id,Point) values(2,1,8);
insert into Point (Course_id,Student_id,Point) values(3,2,8);
insert into Point (Course_id,Student_id,Point) values(4,2,5);
insert into Point (Course_id,Student_id,Point) values(5,3,3);
insert into Point (Course_id,Student_id,Point) values(5,4,9);
insert into Point (Course_id,Student_id,Point) values(4,5,6);
insert into Point (Course_id,Student_id,Point) values(3,6,7);
insert into Point (Course_id,Student_id,Point) values(2,6,7);
insert into Point (Course_id,Student_id,Point) values(1,7,9);
insert into Point (Course_id,Student_id,Point) values(1,7,8);
insert into Point (Course_id,Student_id,Point) values(2,8,9);
insert into Point (Course_id,Student_id,Point) values(3,9,6);
insert into Point (Course_id,Student_id,Point) values(4,10,10);
insert into Point (Course_id,Student_id,Point) values(5,9,7);

-- Tìm kiếm HV có họ Nguyen --
select * from Students where Fullname like 'Nguyen%';

-- Tìm kiếm HV có ten Anh --
select * from Students where Fullname like '%Anh';

-- Tim kiem HV có độ tuổi từ 18-25 --
select * from students where age between 18 and 25;

-- Tìm kiếm HV có id là 12 hoặc 13 --
select * from students where Id like 12 or Id like 13;

-- Thống kê số lượng học viên các lớp (count) --
select Classes.Name, count(Students.id) as Total_Student
from Students
join Classes on Students.Classes_id = Classes.id
group by Classes.id;

-- Thống kê số lượng học viên tại các tỉnh (count) --
select Address.Address, count(Students.Id) as Total_Address
from Students
join Address on Students.Address_id = Address.id
group by Address.id;

-- Tạo view Điểm trung bình --
create view DTB_Point as
select Course.Name, avg(Point.Point) as Average_Point 
from Point
join Course on Course.Id = Point.Course_id
group by Course.id;

-- Điểm trung bình của các khóa học (avg) --
select * from DTB_Point;

-- Đưa ra khóa học có điểm trung bình cao nhất (max) --
select DTB_Point.Name, max(DTB_Point.Average_Point) as Max_AVG
from DTB_Point
group by DTB_Point.name
order by Max_AVG desc
limit 1;