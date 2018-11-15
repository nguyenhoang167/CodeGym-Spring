drop database todo;
create database todo;

use todo;

drop table todo;
create table todo (
    id int auto_increment primary key,
    name varchar(80),
    description varchar(80),
    createdAt date,
    updatedAt date
);
