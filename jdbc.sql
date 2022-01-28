create table users1( id int primary key,username VARCHAR2(60),email VARCHAR2(90));
create table admin1( id int primary key,username VARCHAR2(60),password VARCHAR2(90));
select*from users1;
insert into users1 values('02','rahul','hdhg@435');
insert into users1 values('03','rhul','hdhg@435');
insert into users1 values('04','rahl','hdhg@435');
alter table users1 add dates date;
commit


--create table admin1(id int primary key,email varchar2(100),password varchar2(100));
--describe admin1;

