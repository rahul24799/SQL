select * from employees;
select*from order_items;
select*from orders;
select*from products;
select*from customers;
set serveroutput on
commit;
create or replace package sales as
procedure insertproduct(
   pro_name in products.product_Name%type,
   pro_des in  products.descrip%type,
   pro_stdcost in   products.standard_cost%type,
   pro_lisprice in products.list_price%type,  
   cate_id in products.category_id%type,
   p_status out varchar2, p_error out varchar2);
--   Remove products
procedure delproduct(pro_id products.product_id%type, p_status out varchar2, p_error out varchar2);
 
-- insert order
PROCEDURE insertorder(
c_id orders.customer_id%type,
o_status orders.status%type,
o_salemen orders.salesman_id%type,
o_date orders.order_date%type,
p_status out varchar2,p_error out varchar2);
--delete orders
procedure delorder(o_id in orders.order_id%type,p_status out varchar2,p_error out varchar2);

--insert employee
procedure insertemployee(
 emp_fn employees.first_name%type,
emp_ln employees.last_name%type,
emp_email employees.email%type,
emp_phone  employees.phone%type,
emp_hire  employees.hire_date%type,
m_id employees.manager_id%type,
emp_job employees.job_title%type,
p_status out varchar2,p_error out varchar2) ;

--delete employee
PROCEDURE delemployee( emp_id employees.employee_id%type,p_status out varchar2,p_error out varchar2);

--insert orderitems
procedure insertoritems(
 o_id in order_items.order_id%type,
 pro_id in order_items.product_id%type,
 o_qty in order_items.quantity%type,
 u_pr in order_items.unit_price%type,p_status out varchar2,p_error out varchar2);
--delete order_item
procedure deleteoritems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2);

--insert customer
procedure insertcus(c_name1 in customers.name%type,
  c_address in customers.address%type,
  c_web in customers.website%type,
 c_l in customers.credit_limit%type,
  p_status out varchar2, p_error out varchar2);
--deletecustomer
procedure deletecus(c_id in customers.customer_id%type, p_status out varchar2,p_error out varchar2);
--addcategory
procedure insertcategory(cate_name in categories.category_name%type,p_status out varchar2,p_error out varchar2);
-----------------delete
procedure delcategories(cate_id in categories.category_id%type,p_status out varchar2,p_error out varchar2);
end sales;
/
-------------package body-----------------------------
create or replace package body sales as
procedure  insertproduct(
   pro_name in products.product_Name%type,
   pro_des in  products.descrip%type,
   pro_stdcost in  products.standard_cost%type,
   pro_lisprice in  products.list_price %type,  
   cate_id in products.category_id%type,
   p_status out varchar2, p_error out varchar2)
   is 
begin
   insert into products(product_name,descrip,standard_cost,list_price,category_id)values(pro_name,pro_des,pro_stdcost,pro_lisprice,cate_id);
   if sql%rowcount>0 then 
   p_status:='product inserted';
   end if;
   exception
   when others then
   p_status:='something went wrong';
   p_error:=sqlcode||sqlerrm;
   commit;
   end  insertproduct;
  procedure delproduct(pro_id in products.product_id%type, p_status out varchar2, p_error out varchar2) is
  begin
  delete from products where product_id=pro_id;
  if sql%rowcount>0 then
  p_status:='product deleted'||pro_id;
  end if;
  if sql%rowcount=0
  then p_status:='product'||pro_id||'does not exit';
  end if;
  exception
  when others then
  p_status:='something went wrong';
  p_error:=sqlcode||sqlerrm;
  commit;
  end  delproduct;
  
PROCEDURE insertorder(
c_id in orders.customer_id%type,
o_status in orders.status%type,
o_salemen in orders.salesman_id%type,
o_date in orders.order_date%type,
p_status out varchar2,p_error out varchar2)
is
begin

 insert into orders(customer_id,status,salesman_id,order_date)values(c_id,o_status,o_salemen,o_date);
 if sql%rowcount>0 then 
   p_status:='order inserted';
   end if;
   exception
   when others then
   p_status:='something went wrong';
   p_error:=sqlcode||''||sqlerrm;
   commit;
   end  insertorder;
   procedure delorder(o_id in orders.order_id%type,p_status out varchar2,p_error out varchar2)is
  begin
   delete from orders where order_id=o_id;
   if sql%rowcount>0 then
  p_status:='order deleted'||o_id;
  end if;
  if sql%rowcount=0
  then p_status:='orders'||o_id||'does not exit';
  end if;
  exception
  when others then
  p_status:='something went wrong';
  p_error:=sqlcode||sqlerrm;
  commit;
  end  delorder;
  
  procedure insertemployee(
 emp_fn employees.first_name%type,
emp_ln employees.last_name%type,
emp_email employees.email%type,
emp_phone  employees.phone%type,
emp_hire  employees.hire_date%type,
m_id employees.manager_id%type,
emp_job employees.job_title%type,
p_status out varchar2,p_error out varchar2) is                 
                           
begin
insert into employees(first_name,last_name,email,phone,hire_date,manager_id,job_title)values(emp_fn,emp_ln,emp_email,emp_phone,emp_hire,m_id,emp_job);
    if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
exception
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
   COMMIT;
   END insertemployee;

----delete employees---
PROCEDURE Delemployee(emp_id in employees.employee_id%type,p_status out varchar2,p_error out varchar2) IS
   BEGIN
    
        delete from employees WHERE employee_id = emp_id ;
              if sql%ROWCOUNT >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
     commit;
   END Delemployee;
   
   
    procedure insertoritems(
 o_id in order_items.order_id%type,
 pro_id in order_items.product_id%type,
 o_qty in order_items.quantity%type,
 u_pr in order_items.unit_price%type,p_status out varchar2,p_error out varchar2) is
    begin
    insert into order_items(order_id,product_id,quantity,unit_price)values(o_id,pro_id,o_qty,u_pr);
             if Sql%rowcount>0 then
             p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
COMMIT;
   end insertoritems;
   

   procedure deleteoritems(i_id in order_items.item_id%type,p_status out varchar2,p_error out varchar2)is
begin
   delete from order_items where item_id=i_id;
      if sql%rowcount >0 then
                      p_status:='Deleted';
                 end if;
             if sql%rowcount=0
                then p_status:='No Value Deleted';
                end if;
exception
  when others then
   p_status:='Somthing went wrong';
   p_error:=sqlcode ||' '|| sqlerrm;
   COMMIT;
   end deleteoritems;
   
   
    procedure insertcus(
                        c_name1 in customers.name%type,
                        c_address in customers.address%type,
                        c_web in customers.website%type,
                        c_l in customers.credit_limit%type,
                         p_status out varchar2,
                        p_error out varchar2) is
begin
insert into customers(name,address,website,credit_limit)values(c_name1,c_address,c_web,c_l);
if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
exception
WHEN others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end insertcus;

procedure deletecus(c_id in customers.customer_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from customers where customer_id=c_id;
if Sql%rowcount>0 then
         p_status:='deleted';
          end if;
          if sql%rowcount=0 then
          p_status :='not deleted';
          end if;      
EXCEPTION
WHEN others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
   end deletecus;
   
  procedure insertcategory(cate_name in categories.category_name%type,p_status out varchar2,p_error out varchar2) is
   begin
   insert into categories(category_name)values(cate_name);
        if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
exception
when others then  
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
end insertcategory;

----------deletecustomer
procedure delcategories(cate_id in categories.category_id%type,p_status out varchar2,p_error out varchar2) is
begin
delete from categories where category_id=cate_id;
if Sql%rowcount>0 then
         p_status:='inserted';
          end if;
          if sql%rowcount=0 then
          p_status :='not inserted';
          end if;      
exception
when others then
    p_status :='some thing is  wrong';
     p_error :=sqlcode ||' '|| sqlerrm;
  commit;
  end delcategories; 
  end sales;   
/

declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.insertcus('hari','chennai','www.amazon.com',50000,p_status,p_error);
sales.insertcus('rahul','ramnad','www.flikart.com',10000,p_status,p_error);
dbms_output.put_line(p_status||p_error);
end;


declare 
p_status varchar2(100);
p_error varchar2(100);
begin 
sales.deletecus(500,p_status,p_error);
dbms_output.put_line(p_status||p_error);
end;
/

select*from customers;



insert into users_detail(user_name,email_id,password,phone_number)values('ajith','ajith143@gmail.com','143ajith',9994136328);
insert into users_detail(user_name,email_id,password,phone_number)values('vinoth','vinoth456@gmail.com','456vinoth',7632841475);
insert into users_detail(user_name,email_id,password,phone_number)values('Mani','mani65@gmail.com','456manis',76392414);


