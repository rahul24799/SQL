
create table products(
product_id int  GENERATED ALWAYS AS IDENTITY START WITH 01 PRIMARY KEY,
product_name varchar(20),
descrip varchar(20),
standard_cost number(7,2),
list_price number(7,2),
category_id int,FOREIGN key(category_id) REFERENCES categories(category_id));
drop table products CASCADE CONSTRAINTS;

desc products;
create table order_items(
order_id int ,
item_id  int GENERATED ALWAYS AS IDENTITY START WITH 100 PRIMARY KEY,
product_id int,
quantity int,
unit_price number(7,2),FOREIGN key(order_id) REFERENCES orders(order_id),FOREIGN key(product_id) REFERENCES products(product_id));

drop table order_items CASCADE CONSTRAINTS;

alter table order_items add constraint fk_prod foreign key(product_id) references products(product_id);

create table orders(
order_id int GENERATED ALWAYS AS IDENTITY START WITH 100 PRIMARY KEY,
customer_id int,
status varchar(20),
salesman_id int,
order_date date,FOREIGN key(customer_id) REFERENCES customers(customer_id));
drop table orders CASCADE CONSTRAINTS;
--alter table order_items add constraint fk_orderid foreign key(order_id) references orders(order_id);
--alter table orders add constraint pk_orderid primary key(order_id);
--alter table orders add constraint fk_custid foreign key(customer_id) references customers(customer_id);
desc order_items;
drop table order_items;

desc orders;

create table customers(
customer_id int  GENERATED ALWAYS AS IDENTITY START WITH 500 PRIMARY KEY,
name varchar(20),
address varchar(20),
website varchar(20),
credit_limit number(7,2));
drop table customers CASCADE CONSTRAINTS;




create table employees(
employee_id int GENERATED ALWAYS AS IDENTITY START WITH 1000 PRIMARY KEY,
first_name varchar(20),
last_name varchar(20),
email varchar(20),
phone int,
hire_date date,
manager_id int,
job_title varchar(20));
drop table employees CASCADE CONSTRAINTS;
alter table orders add constraint fk_salesid foreign key(salesman_id) references employees(employee_id);

create table categories(category_id int GENERATED ALWAYS AS IDENTITY START WITH 5001 primary key,category_name varchar2(30));
select * from categories;
desc orders;
desc products;
select * from products;
insert into products values(1,'noisefit','track fitness',3000.00,2800.00,1);
insert into products values(2,'amazefit','track fitness',4000.00,3800.00,1);
insert into products values(3,'profit','track fitness',2000.00,1800.00,1);
insert into products values(4,'mifit','track fitness',5000.00,4500.00,1);

alter table products modify product_name varchar(40);
alter table products modify description varchar(50);
alter table products modify standard_cost number(13,2);
alter table products modify list_price number(13,2);

insert into products values(5,'mi note 10','mid range smartphone',23000.00,22800.00,2);
insert into products values(6,'samsung m40','mid range smartphone',14000.00,13800.00,2);
insert into products values(7,'poco x3 pro','mid range gaming mobile',25000.00,24800.00,2);
insert into products values(8,'i phone 12 mini','mini version of iphone 12',55000.00,54500.00,2);

select * from tab;
select * from customers;
--insert customers--
insert into customers values('mani','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(2,'hari','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(3,'suresh','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(4,'surya','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(5,'agis','85,karambakkam,porur','www.amazon.com',50000.00);
insert into customers values(6,'vinith','85,karambakkam,porur','www.amazon.com',50000.00);

select * from orders;
--orders--
insert into orders values(1,1,'shipped',1,'12-12-2021');
insert into orders values(2,1,'shipped',1,'13-12-2021');
insert into orders values(3,2,'packed',5,'14-12-2021');
insert into orders values(4,3,'delivered',1,'18-12-2021');
insert into orders values(5,2,'packed',5,'15-12-2021');
insert into orders values(6,5,'shipped',5,'12-12-2021');

update orders
set salesman_id = 1
where order_id in 6;
commit;
select * from order_items;
select * from orders;
--insert order_items--
insert into order_items values(1,1,1,1,2800.00);
insert into order_items values(2,2,3,1,1800.00);
insert into order_items values(3,3,5,1,22800.00);
insert into order_items values(4,4,2,1,3800.00);
insert into order_items values(5,5,4,1,4500.00);
insert into order_items values(6,6,7,5,24800.00);


update order_items
set quantity = 5
where order_id in 1;


alter table employees modify job_title varchar(50);
--insert employees--
insert into employees values(1,'mani','kandan','manihfg,fjf@gmail.com',8685094302,'01-04-2019',4,'delivery boy');
insert into employees values(2,'suresh','kumar','sureshhfg,fjf@gmail.com',8685094302,'11-08-2019',6,'help and support');
insert into employees values(3,'hari','krishnan','harihfg,fjf@gmail.com',8685094302,'15-08-2019',6,'help and support');
insert into employees values(4,'abdul','agis','agishfg,fjf@gmail.com',8685094302,'25-05-2019',4,'manager');
insert into employees values(5,'surya','kumar yadav','suryahfg,fjf@gmail.com',8685094302,'29-07-2019',4,'delivery boy');
insert into employees values(6,'vinith','kumar','vinithhfg,fjf@gmail.com',8685094302,'28-09-2020',6,'manager');

select * from employees;
select*from order_items;
select*from orders;
select*from products;
select*from customers;




--select order_items.quantity from orders inner join order_items on orders.order_id=order_items.order_id where order.status='packed';

--customer status
select customers.customer_id,orders.order_id,orders.status,customers.address,orders.order_date 
from customers inner join orders on customers.customer_id=orders.order_id;

select orders.salesman_id,employees.first_name,employees.last_name,count(order_id) 
as ord from orders inner join employees on orders.salesman_id=employees.employee_id
group by salesman_id, orders.salesman_id,
employees.first_name, employees.last_name having count(order_id)<=2;




select order_date,sum(order_items.unit_price)as totalprice,sum(order_items.quantity)as totalquantity from order_items
inner join orders on orders.order_id=orders.order_id group by orders.order_date, order_date having orders.order_date='12-12-21';

select  order_id,products.product_name,products.description, order_items.quantity,order_items.unit_price,
(quantity*unit_price)as Amount
from order_items inner join products
on products.product_id=order_items.order_id ;


select*from products;
select * from orders;
select * from employees;
select* from  order_items;
select*from customers;

SELECT first_name,last_name FROM employees 
WHERE manager_id IN 
(SELECT employee_id 
FROM employees 
--WHERE customer_id IN 
--(SELECT customer_id 
--FROM customers 
WHERE order_id IN 
(SELECT order_id 
FROM orders
WHERE salesman_id=5));


select product_id,product_name,description,round((standard_cost-(select avg (standard_cost) 
from products)),2)as standard_cost,
case when standard_cost >=(select avg(standard_cost)from products)
then 'high'
else 'low' 
end as avgstatus from products;


select distinct job_title from employees;

select *from employees where employee_id in(select manager_id from employees);


select product_id,sum (quantity)from order_items group by product_id;

--declare 
--A grade CHAR( :):=upper ('&p grade')
--a employees  varchar2(100);
--begin
--a employees  :=
--case A grade
--when s then 'Excellent'
--when b then 'very good'
--when c then 'good'
--else 'no such grade'
--end;
--dbms output.put line('grade:'||a grade||'employees'||a employees);
--end;


select*from products;
select * from orders;
select * from employees;
select* from  order_items;
select*from customers;
select * from categories;
set serveroutput on
declare
a number:=0;
begin
for a  in  10..20 loop

dbms_output.put_line('value of a:'||a);
end loop;
end;
/


begin
for a in 1..50
loop
if mod(a,5)=0
then
 DBMS_OUTPUT.PUT_LINE(a);
 end if;
end loop;
end;
/









declare
employees  employee_temp%ROWTYPE;
BEGIN
employees.employee_id:=null;
employees.manager_id:=6;
dbms_output.put_line('employees.manager:'||employees.manager_id);
end;




declare 
customer_record customers%rowtype;
begin
select *into customer_record from customers where id=2;
dbms_output.put_line('customer id:'||customers.customer_id);
dbms_output.put_line('customer name:'||customers.name);
dbms_output.put_line('customer Address:'||customers.address);
dbms_output.put_line('customer website:'||customers.website);
dbms_output.put_line('customer credit:'||customers.credit_limit);
end;
/


 set serveroutput on
declare 
n2 number:='&num2';
n1 number:='&num';
begin
loop
dbms_output.put_line(n1*n2);
if (n2=10) then
exit ;
end if;
n2:=n2+1;
end loop;
end;
/


                 
--DECLARE
--    l_ename emp.ENAME%TYPE;
--    l_emp_id emp.emp_id%TYPE := &employee_id;
--BEGIN
--    -- get the employee name by id
--    SELECT ename INTO l_ename
--    FROM emp
--    WHERE emp_id = l_emp_id;
--    -- show the employee name   
--    dbms_output.put_line('Employee name is ' || l_ename);
--END;
--/
--    dbms_output.put_line('Employee name is ' || l_ename);
-- 
--EXCEPTION 
--        WHEN NO_DATA_FOUND THEN
--            dbms_output.put_line('employee ' || l_emp_id ||  ' does not exist');
--			
--END;
--/


 set serveroutput on
declare 
i number(3);
j number(3);
begin
 i:=2;
 loop
  j:=2;loop
  exit when (mod(i,j)=0);
  j:=j+1;
  end loop;
  if(j=1) then
  dbms_output.put_line(i ||'is prime');
  end if;
  i:=i+1;
  exit when i=20;
  end loop;
  end;
  /
  
 select * from employees;
 declare
 e_id employees.employee_id%type:=5;
 e_firstname employees.first_name%type;
 e_email employees.email%type;
 e_number employees.phone%type;
 begin
 select first_name,email,phone into e_firstname,e_email ,e_number from employees
 where employee_id=e_id;
 dbms_output.put_line('first_name'||e_firstname);
 dbms_output.put_line('email'||e_mail);
 dbms_output.put_line('phone'||e_number);
 exception
 when no_data_found then
      dbms_output.put_line('No search employee'); 
 when others then
      dbms_output.put_line('Error'); 
 end;
 /
 
 select * from employees;
declare
first_name employees.first_name%type;
last_name employees.last_name%type;
E_mail employees.email%type;
cursor c_u is select employees.first_name,employees.last_name,employees.email  from employees;
begin
open c_u;
loop
fetch c_u into first_name,last_name,E_mail;

exit when c_u%notfound;
dbms_output.put_line(first_name||' '||last_name||' '||e_mail);
end loop;
close c_u;
end;
/
select employees.first_name,employees.last_name,employees.email  from employees;

--CREATE OR REPLACE FUNCTION get_total_sales(
--    in_year PLS_INTEGER
--) 
--RETURN NUMBER
--IS
--    l_total_sales NUMBER := 0;
--BEGIN
--    -- get total sales
--Assignment statementDECLARE 
--l_sales_2021 NUMBER := 0; 
--BEGIN 
--l_sales_2021 := get_total_sales (2021); 
--DBMS_OUTPUT.PUT_LINE('Sales 2021: ' || l_sales_2021); 
--END;
--
--Boolean expressionBEGIN
--    IF get_total_sales (2021) > 10000000 THEN
--        DBMS_OUTPUT.PUT_LINE('Sales 2021 is above target');
--    END IF;
--END;
--SQL statement
--SELECT get_total_sales(2021) FROM dual;
--
--
--
--
--
-- 
-- 
--

 select * from employees;
/
set serveroutput on
declare 
id employees.employee_id%type;
j_b employees.job_title%type;
f_name employees.first_name%type;
cursor v_d is select employees.first_name,employees.job_title from employees
where employees.employee_id=id;
begin
id :=&id;
open v_d;
loop
fetch v_d into f_name,j_b ;
exit when v_d%notfound;
dbms_output.put_line(f_name||' '||j_b);
end loop;
close v_d;
end;
/

declare
f_name employees.first_name%type;
l_name employees.last_name%type;
e_name employees.email%type;
cursor c_d is select employees.first_name,employees.last_name into f_name,l_name from employees
where employees.employee_id=4 
for update of employees.phone;
e_name c_d%rowtype;
begin
open c_d;
loop
fetch c_d into e_name ;
Exit when c_d % notfound;
update employees
set employees.phone=employees.phone+91
where f_name=e_name.f_name;
end loop;
end;
/
set serveroutput on
create or replace package e_package as
procedure addemployees(e_id  employee_id%type,
f_name employees.first_name%type,
l_name employees.last_name%type,
e_mail employees.email%type,
p_number employees.phone%type);
procedure delemployees(e_id employee_id%type);
procedure listemployees;
end e_package;
/

------------------------------------------------------------------------------------
--c_pending_status CONSTANT VARCHAR(10) := 'Pending';
--  gc_canceled_status CONSTANT VARCHAR(10) := 'Canceled';
--
--  -- cursor that returns the order detail
--  CURSOR g_cur_order(p_order_id NUMBER)
--  IS
--    SELECT
--      customer_id,
--      status,
--      salesman_id,
--      order_date,
--      item_id,
--      product_name,
--      quantity,
--      unit_price
--    FROM
--      order_items
--    INNER JOIN orders USING (order_id)
--    INNER JOIN products USING (product_id)
--    WHERE
--      order_id = p_order_id;
--
--  -- get net value of a order
--  FUNCTION get_net_value(
--      p_order_id NUMBER)
--    RETURN NUMBER;
--
--  -- Get net value by customer
--  FUNCTION get_net_value_by_customer(
--      p_customer_id NUMBER,
--      p_year        NUMBER)
--    RETURN NUMBER;
--
--END order_mgmt;


CREATE OR REPLACE PACKAGE c_ord AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
end c_ord;

CREATE OR REPLACE PACKAGE body c_ord  AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date) 
         VALUES(o_id, c_id, o_status, o_salmen, o_date); 
         if Sql%found then 
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then 
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm'); 
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addorder;
   
   
   END  c_ord;
   /

execute c_ord.addorder('123','21','finsih','1100','10-05-2021');
desc orders;
select*from orders;
select * from employees;
select*from order_items;
select*from orders;
select*from products;
select*from customers;
--------------------------------------------
set serveroutput on
CREATE OR REPLACE PACKAGE c_prd AS
   -- Adds a product
   PROCEDURE addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_stprice   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)   ;
   
   -- Removes a product
   PROCEDURE delproduct(p_id  products.product_id%TYPE);
   --Lists all products
   
 
END c_prd;
/

------package body-----
desc products
CREATE OR REPLACE PACKAGE body c_prd  AS
   -- Adds a product
   PROCEDURE addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_stprice   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO products(product_id,product_Name,standard_cost,list_price,category_id)
         VALUES(p_id, p_name, p_stprice, p_lprice, p_catid);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addproduct;
   
   PROCEDURE delproduct(p_id  products.product_id%type)is
   BEGIN
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END delproduct;
   
   END  c_prd;
   /
EXECUTE  c_prd.addproduct('7','NOKIA',250,20,123);
EXECUTE c_prd.delproduct(765);
set serveroutput on;
desc products;
select*from products;


select* from orders;

--------order----

CREATE OR REPLACE PACKAGE c_ord AS
   -- Adds a product
   PROCEDURE addorder(o_id orders.order_id%type,
   c_id orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
end c_ord;

----order body----
CREATE OR REPLACE PACKAGE body c_ord  AS
   -- Adds a product
   PROCEDURE addorder(o_id orders.order_id%type,
   c_id orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, c_id, o_status, o_salmen, o_date);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addorder;
   
   
   END  c_ord;
   /

execute c_ord.addorder('7','8','finsihied','12','11-06-2021');
desc orders;
select*from orders;
set serveroutput on
-------employee---
create or replace package e_emp as
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type);

end e_emp;

------body------
CREATE OR REPLACE PACKAGE body e_emp  AS
procedure add_emp(emp_id employees.employee_id%type,emp_name employees.name%type ,emp_email employees.email%type ,emp_no employees.phone%type,
h_date employees.hire_date%type,man_id employees.manager_id%type,emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,name,email,phone,hire_date,manager_id,job_title) values(emp_id,emp_name,emp_email,emp_no,h_date,man_id,emp_job);
  if Sql%found then
         dbms_output.put_line('employee  inserted');
         else
          dbms_output.put_line('employee not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('employee not inserted ||||sqlerrm');
       dbms_output.put_line('remployee not inserted');

   
   COMMIT;
   END add_emp;
   end e_emp;
   /
   execute e_emp.add_emp(456,'pandidurai','pandi@gmail.com',9840220587,'22-12-2021',777,'sales');
  desc employees;
  select* from employees;
select* from order_items;
------order items----
CREATE OR REPLACE PACKAGE c_orderitem AS
   -- Adds a product
   PROCEDURE add_orderitem(o_oi order_items.order_id%type,
   o_id order_items.item_id%type,
    o_pi  order_items.product_id%type,
   o_qi  order_items.quanity_id %type,  
   o_price  order_items.unit_price%type);
end c_orderitem;

-----order items body----
CREATE OR REPLACE PACKAGE body c_order_item  AS
procedure add_orderitem(o_oi order_items.order_id%type,
   o_id order_items.item_id%type,
    o_pi  order_items.product_id%type,
   o_qi  order_items.quanity_id %type,  
   o_price  order_items.unit_price%type)
is iv_err_code varchar2(20);
begin
insert into order_items(order_id ,item_id ,product_id ,quanity_id ,unit_price)
values(o_oi,o_id,o_pi_,o_qi,o_price);
  if Sql%found then
         dbms_output.put_line('order_items  inserted');
         else
          dbms_output.put_line('order_items not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('order_items not inserted ||||sqlerrm');
       dbms_output.put_line('order_items not inserted');

   
   COMMIT;
   END add_order_item;
   end c_order_item;
   /
------customer spcification---
select *from customers;
desc customer;
  CREATE  or replace PACKAGE cus_table AS  
procedure addCustomer(c_id customer.customer_id%TYPE, c_name customer.customer_name%type,c_address customer.address%type,
c_web customer.website%type,c_climit customer.create_limit%type);

end cus;
/
-------package--------

CREATE OR REPLACE PACKAGE BODY cus_table AS
procedure addCustomer (c_id customer.customer_id%TYPE, c_name customer.customer_name%type,c_address customer.address%type,
c_web customer.website%type,c_climit customer.create_limit%type)
is iv_err_code varchar2(20);  
begin    
insert into customer(customer_id,customer_name,address,website,create_limit ) values
( c_id,c_name,c_address,c_web,c_climit );  
if Sql%found then
         dbms_output.put_line('customer inserted');
         else
          dbms_output.put_line('customer not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('customers not inserted ||||sqlerrm');
       dbms_output.put_line('customers not inserted');
       
 end addcustomer;
 end cus_table;
 
 select *from customers;
 set serveroutput on
declare 
cus_id customers.customer_id%type:= &cc_id; 
cus_name customers.name%type;
cus_address customers.address%type;
invalid_id Exception;
begin
if cus_id <=0 then
raise invaild_id;
else
select name,address into cus_name,cus_address from customers
where customer_id=cus_id;
dbms_output.put_line('Name' || cus_name);
dbms_output.put_line('address' || cus_address);
end if;
exception 
when invalid_id then
dbms_output.put_line('id must greater than zero');
when no_data_found then
dbms_output.put_line('no customer found');
when others then
dbms_output.put_line('error');
end;
/

create or Replace package body c_package as
procedure addCustomer(cus_id  customer.id%type, 
      cus_name customers.Name%type, 
      c_addr  customers.address%type) 
is 
begin
insert into customers (customer_id,name,address) values(cus_id,cus_name,cus_addr);
end addcustomer;
procedure deleteCustomer(cus_id   customers.id%type) IS 
begin
delete from customers 
where customer_id = cus_id; 
end deleteCustomer;
procedure listCustomer is
cursor cus_customers is select name from customers;
type cus_list is table of customers.name%type;
 name_list cus_list := cus_list(); 
 counter integer:=0;
begin 
      FOR n IN c_customers LOOP 
      counter := counter +1; 
      name_list.extend; 
      name_list(counter) := n.name; 
      dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter)); 
      END LOOP; 
   END listCustomer;
   
END c_package; 
/
select*from customers;
create or replace function Customers 
return number is
   total number(2) := 0; 
BEGIN 
   SELECT count(*) into total 
   FROM customers; 
    
   RETURN total; 
END; 
/ 
