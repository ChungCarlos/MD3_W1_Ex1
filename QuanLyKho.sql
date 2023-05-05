create database QuanLyKho;
use QuanLyKho;
create table PhieuXuat(
SoPX int not null primary key auto_increment,
NgayXuat datetime);

create table VatTu(
MaVTU int not null primary key auto_increment,
TenVTU varchar(40));

create table ChiTietPhieuXuat(
SoPX int not null,
MaVTU int not null,
unique(SoPX,MaVTU),
DGXuat float,
SLXuat int,
foreign key (SoPX) references PhieuXuat(SoPX),
foreign key (MaVTU) references VatTu(MaVTU));

create table PhieuNhap(
SoPN int not null primary key auto_increment,
NgayNhap datetime);

create table ChiTietPhieuNhap(
MaVTU int not null,
SoPN int not null,
unique(MaVTU,SoPN),
DGNhap float,
SLNhap int,
foreign key(MaVTU) references VatTu(MaVTU),
foreign key(SoPN) references PhieuNhap(SoPN));

create table DonDH(
SoDH int not null primary key auto_increment,
MaNCC int not null,
unique(MaNCC),
foreign key(MaNCC) references NhaCC(MaNCC),
NgayDH datetime);

create table NhaCC(
MaNCC int not null primary key auto_increment,
TenNCC varchar(40),
DiaChi varchar(40),
SDT varchar(20));

create table ChiTietDonDatHang(
MaVTU int not null,
SoDH int not null,
unique(MaVTU,SoDH),
foreign key (MaVTU) references VatTu(MaVTU),
foreign key (SoDH) references DonDH(SoDH));
