drop database test;
create database test;

use test;

drop table employee;
create table employee (
    id int auto_increment primary key,
    firstName varchar(80),
    lastName varchar(80),
    email varchar(80),
    salary int,
    dayOfBirth varchar(10)
);

insert into employee(firstName, lastName, email, salary, dayOfBirth) values
("hoang", "nguyen", "hoang.nguyen@vnuk.edu.vn", 1000000, "17071997"),
("tran", "viet thanh", "thanh.trangviet@vnuk.edu.vn", 3000000, "09011998");