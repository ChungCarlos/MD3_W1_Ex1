-- Tham so in --
delimiter //
create procedure getCusById(
IN cusNum int
)
begin
    select * from customers where customerNumber = cusNum;
end //
delimiter ;

call getCusById(175);

-- Tham so out --
delimiter //
create procedure GetCustomersCountByCity(
out total int)
begin
    select count(customerNumber)
        into total
    from customers;
end //
delimiter ;

call GetCustomersCountByCity(@total);
select @total;


DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8