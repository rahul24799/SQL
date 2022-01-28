create table student(id int,name varchar(32),phonenum int);
describe student;
alter table student add mobilenumber varchar(10);
alter table student add gender ;
alter table student add address varchar(10);
alter table student drop column mobilenumber;
desc student;
alter table student rename column id to sno;
select *from student;   
insert into student(sno,name,phonenum,address,gender) values('1001','rahul','7639241475','ramnad','male');
delete from student where sno=1001;
insert into student(sno,name,phonenum,address,gender) values('1002','vinoth','763923476','erode','male');
insert into student(sno,name,phonenum,address,gender) values('1003','munis','76392414675','ramnad','male');
insert into student(sno,name,phonenum,address,gender) values('1004','siddharth','7639241446','theni','male');
insert into student(sno,name,phonenum,address,gender) values('1005','mani','7639241419','madurai','male');
insert into student(sno,name,phonenum,address,gender) values('1006','hari','7639247875','ramnad','male');



declare
stu_name student.name%type;
stu_add student.address%type;
stu_gen student.gender%type;
cursor cu_sor is select name,address,gender from student;
begin 
open cu_sor;
loop
fetch cu_sor into stu_name,stu_add,stu_gen;
exit when cu_sor%rowcount>3;
dbms_output.put_line(stu_name||stu_add||stu_gen);
end loop;
close cu_sor;
end;
/
set serverout on




