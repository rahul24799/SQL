create table product(id int primary key, name varchar(38),description varchar(38) );
describe product;
alter table product add price int;       // add table
alter table product add mobilenum int;
select * from product;
alter table product drop column mobilenum;      //delete table
describe product;
select * from product;          //create table format
insert into product(id , name ,description ) values('1011','Rahul','hloo friends');
insert into product(id , name ,description ) values('1015','sid','hloo friends');
insert into product(id , name ,description ) values('1019','vinoth','hloo friends');
insert into product values('1015','munis','higuys');
alter table product drop column price;
alter table product add price int;
insert into product(id , name ,description ) values('1016','vinoth','hloo friends');
alter table product modify price  default '500'; 
delete from product where id=1010;
delete from product where id=1012;
select*from product;
delete from product where id=1011;  //delete row
delete from product where id=1015;
update product set price=1000 where id=1018;    //change values in price
insert into product (id , name ,description ) values('1020','aliabhatt','welcome too all');
alter table product rename column id to empid;
update product set name='rahul',description='welcome to all' where empid=1014;
update product set name='keerthi sanon',description='welcome to all' where empid=1016;
select name from product order by empid desc;
select * from product order by empid desc;
select name,description from product where price=1000;
select name from product where empid=1014;
select * from product where name like 'a%';
select * from product where name like 'r%';
select * from product where name like '%no%';
create table product_copy as select empid,name from product;
select * from product_copy;
select name as usersq from product_copy;

create table student1 (id int primary key,dept varchar(38),empid int
,foreign key(empid) references product(empid));
select * from student1;
insert into student1 values(1,'mech',1019);
insert into student1 values(2,'mech',1014);
insert into student1 values(3,'mech',1018);
insert into student1 values(4,'mech',1020);


create table offer_details(offer_id int GENERATED ALWAYS AS IDENTITY START WITH 1000 INCREMENT by 1 PRIMARY KEY,operator_id int not null,plan_id int not null,offer_description varchar2 (100) not null,offer_validity varchar2 (100) ,
foreign key (operator_id)references operator_details (operator_id));
drop table offer_details;
select*from offer_details;





