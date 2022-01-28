select * from customers;
/

CREATE OR REPLACE FUNCTION get_customer(
    c_name in customers.name%type,
    c_addr in customers.address%type
) 
RETURN NUMBER
IS
    cus_id NUMBER:= 0;
BEGIN 
    SELECT customer_id INTO cus_id FROM customers  WHERE c_name = name and c_addr=address;
    RETURN cus_id ;
END;
/

select get_customer('rahul','ramnad') from customers where rownum<2;

 select get_customer(name,address) from customers;



create table checker(checker_id int GENERATED ALWAYS AS IDENTITY START WITH 1000 INCREMENT by 1 PRIMARY KEY,
table_name varchar(30),
Status varchar(20),
user_name varchar(30),
transction_date date);
select * from checker;

create or replace trigger
customers_table_status
after
update or delete on customers for each row
declare
any_changes varchar(50);
begin
any_changes:=case
when updating then 'update'
when deleting then 'delete'
end;
insert into checker(table_name,Status,user_name,transction_date)values('customers',any_changes,user,sysdate);
end;
/
update customers set name='gowtham' where customer_id=502;
commit;
select * from checker;
