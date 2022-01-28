select*from orders;
select * from employees;
select*from order_items;
select*from orders;
select*from products;
select*from customers;


create or replace package sales as
--ADDproducts
procedure Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.description%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type);

--   Delete products
   PROCEDURE Delproduct(p_id  products.product_id%TYPE);
   
--   ADD order
 procedure Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salsmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
--   delorder
   Procedure Delorder(o_id  orders.order_id%TYPE);
   end;
  /
   create or replace package body sales as 
   PROCEDURE Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.description%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)  
  IS iv_err_code varchar2(20);
  begin 
  insert into products(product_id,product_name,description,standard_cost,list_price,category_id) values (p_id,p_name,p_des,p_stdcost,p_lprice,
  p_catid);
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
       end Addproduct;
procedure Delproduct(p_id  products.product_id%type) is
begin
 DELETE FROM products WHERE product_id =p_id ;
       if sql%FOUND then
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   end if;
     
   end Delproduct;
  procedure Addorder(o_id orders.order_id%type,
   o_cid orders.customer_id%type,
   o_status   orders.status%type,
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type) is
   iv_err_code varchar2(20);
  begin 
  insert into orders (order_id,customer_id,status,salesman_id,order_date )values(0_id,o_cid,o_status,o_salmen,o_date);
   if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
EXCEPTION
when other then
        iv_err_code:='e';
        dbms_output.put_line('record  not inserted ||||sqlerrm');
        dbms_output.put_line('record  not inserted'); 
        end addorder;
procedure delorder(o_id orders.order_id%type) is 
begin
      delete from orders where order_id=o_id;
    if sql%FOUND then
         DBMS_OUTPUT.PUT_LINE('ORDER DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('ORDER NOT DELETE');
   end if;
  end delorder;
  end sales;     

       
   