create database test;
use test;
create table Products(
    id int primary key auto_increment,
    productCode int,
    productName varchar(40),
    productPrice float,
    productAmount int,
    productDescription varchar(255),
    productStatus ENUM('active', 'inactive')
);

-- Chèn dữ liệu --
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values (1,'Công',10,10,'Hê nhô','active'),
       (2,'Chung',20,20,'Hi','inactive'),
       (3,'Tuấn',13,40,'Hê nhô','active'),
       (4,'Hùng',40,60,'Hê','inactive'),
       (5,'Nam',50,30,'nhô','active'),
       (6,'Hải',60,70,'Hê nhô','inactive'),
       (7,'Anh',70,90,'Xin Chào','active');

select * from Products;

-- Tạo Unique Index --
create unique index index_code
on products(productCode);

-- Tạo Composite Index --
create index index_composite
on products(productName ,productPrice);

explain select * from products
where productName = 'Hê nhô';

-- Tạo View --
create view view_product as
    select productCode,productName,productPrice,productStatus
    from products;
select * from view_product;

-- Sửa View --
alter view view_product as
    select productCode,productName,productPrice
from products;

-- Xoá View --
drop view view_product;

-- Store procedure --
delimiter //
drop procedure if exists proAllCus //
create procedure proAllCus()
begin
    select * from products where productAmount = 20;
end //
delimiter ;

call proAllCus();

-- Tạo store procedure thêm một sản phẩm mới --
delimiter //
create procedure proCus(
IN p_Code int,
IN p_Name varchar(40)
    )
begin
    insert into products(productCode,productName)
        values (p_Code,p_Name);
end //
delimiter ;

drop procedure proCus;

call proCus(11,'Hungas');
-- Tạo store procedure sửa thông tin sản phẩm theo id --
delimiter //
create procedure edit_Pro(
IN p_ID int, IN p_Code int,
IN p_Name varchar(40)
)
begin
    update products
        set productCode = p_Code,
            productName = p_Name
    where id = p_ID;
end //
delimiter ;

call edit_Pro(17,19,'Hung Cho');

-- Tạo store procedure xoá sản phẩm theo id --
delimiter //
create procedure delete_Pro(
IN p_ID int
)
  begin
      delete from products
          where id = p_ID;
end //
delimiter ;

call delete_Pro(19);