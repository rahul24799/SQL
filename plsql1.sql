select*from orders;
select * from employees;
select*from order_items;
select*from orders;
select*from products;
select*from customers;
/

set serveroutput on
/
--product table---

CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.description%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)   ;
   
   -- Removes a product
   PROCEDURE Delproduct(p_id  products.product_id%TYPE);

----order table---
----Add order table----
 PROCEDURE Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);

---delete order table----
PROCEDURE Delorder(o_id  orders.order_id%TYPE);

------employee table---
---employee Addtable---
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.first_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,
emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type);

---delete employee---
PROCEDURE Delemp(emp_id  employees.employee_id%TYPE);

-----orderitems---
 PROCEDURE Add_orderitem(oi_id order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity %type,  
   oi_uprice  order_items.unit_price%type);

----delorderitem---
PROCEDURE Delorderitem(oi_id order_items.order_id%TYPE);

-----customer table----
----Addcustomer---
procedure addCustomer(c_id customer.customer_id%type,
c_name customer.customer_name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.credit_limit%type);

----delcustomer---
procedure Delcustomer(c_id customer.customer_id%type);
end sales;
/

select * from products;

-----package body-----
CREATE OR REPLACE PACKAGE body sales  AS
   -- Add product
    procedure Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.description%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)  
   IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO products(product_id,product_Name,description,standard_cost,list_price,category_id)
         VALUES(p_id, p_name,p_des, p_stdcost, p_lprice, p_catid);
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
   END Addproduct;
   ----delete program---
   PROCEDURE Delproduct(p_id  products.product_id%type) IS
   BEGIN
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END Delproduct;
  end sales;

------orders program----
PROCEDURE Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, o_cid, o_status, o_salmen, o_date);
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
----delete order program---  
   PROCEDURE Delorder(o_id  orders.order_id%type) IS
   BEGIN
      DELETE FROM orders WHERE order_id =o_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('order DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('order NOT DELETE');
   END IF;
     
   END delorder;
   
-------employee program----
-----Add employeee----
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.salesman_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,
emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,salesman_name,last_name,email,phone,hire_date,manager_id,job_title)
values(emp_id,emp_salesman,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);

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
   END Add_emp;

----delete employees---
PROCEDURE Delemp(emp_id  employees.employee_id%type) IS
   BEGIN
      DELETE FROM employees WHERE employee_id=emp_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('employee DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('employee NOT DELETE');
   END IF;
     
   END Delemp;
 
----orderitems program----
 PROCEDURE Add_orderitem(oi_oi order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity_id %type,  
   oi_uprice  order_items.unit_price%type)
is iv_err_code varchar2(20);
begin
insert into order_items(order_id ,item_id ,product_id ,quanity_id ,unit_price)
values(oi_oi,oi_itemid,oi_proid,oi_qi,oi_uprice);
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
   END Add_orderitem;
----delete order_items---
PROCEDURE Delorderitem(oi_oi order_items.order_id%type) IS
   BEGIN
      DELETE FROM order_items WHERE order_id=oi_oi ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('orderitem DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('orderitem NOT DELETE');
   END IF;
     
   END Delorderitem;
 
  ------customer----
   procedure addCustomer(c_id customer.customer_id%TYPE,
c_name customer.customer_name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.create_limit%type)
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

----delete customer---
PROCEDURE Delcustomer(c_id customer.customer_id%type) IS
   BEGIN
      DELETE FROM customer WHERE customer_id=c_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('customer DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('customer NOT DELETE');
   END IF;
     
   END Delcustomer;

   end sales;
---tables----  
 select* from products;
 select* from orders;
 select* from employees;
 select* from order_items;
 select* from customer;
   
   
   
 set serveroutput on;  
 --exectute  product--  
EXECUTE sales.addproduct(120,'vivo','good',15000,16000,1234);
EXECUTE sales.delproduct(999);

---execute order--
execute sales.addorder(210,31,'preocess',101,'10-10-2020');
execute sales.delorder(209);  

----execute employee---
execute sales.add_emp(1011,'ram','kumar','ramkumar@gmail.com',987654321,'12-12-2021',11,'worker');
execute sales.delemp(1009);

----execute orderitem---
execute sales.add_orderitem(333,222,111,21,1000);
execute sales.delorderitem(209);

----execute customer---
execute sales.addcustomer(21,'ram','ganapathi st','filpkart',8000);
execute sales.delcustomer(21);