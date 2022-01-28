Create table LMS_MEMBERS
(MEMBER_ID Varchar(10),MEMBER_NAME Varchar(30) NOT NULL,CITY Varchar(20),DATE_REGISTER Date NOT NULL,DATE_EXPIRE Date ,MEMBERSHIP_STATUS Varchar(15)NOT NULL,Constraint LMS_cts1 PRIMARY KEY(MEMBER_ID));
describe LMS_MEMBERS;
Create table LMS_SUPPLIERS_DETAILS
(SUPPLIER_ID Varchar(3),SUPPLIER_NAME Varchar(30) NOT NULL,ADDRESS Varchar(50),CONTACT int NOT NULL,EMAIL Varchar(15) NOT NULL,Constraint LMS_cts2 PRIMARY KEY(SUPPLIER_ID));
DESCRIBE LMS_MEMBERS;
Create table LMS_FINE_DETAILS
(FINE_RANGE Varchar(3)PRIMARY KEY,FINE_AMOUNT decimal(10,2) NOT NULL);
DESCRIBE LMS_MEMBERS;
Create table LMS_BOOK_DETAILS
(BOOK_CODE Varchar(10),BOOK_TITLE Varchar(50) ,CATEGORY Varchar(15) NOT NULL,AUTHOR Varchar(30) NOT NULL,PUBLICATION Varchar(30),
PUBLISH_DATE Date,BOOK_EDITION int,PRICE decimal(8,2) NOT NULL,RACK_NUM Varchar(3),DATE_ARRIVAL Date NOT NULL,SUPPLIER_ID Varchar(3) NOT NULL,
Constraint LMS_cts4 PRIMARY KEY(BOOK_CODE),Constraint LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID));
DESCRIBE LMS_MEMBERS;
Create table LMS_BOOK_ISSUE
(BOOK_ISSUE_NO int,MEMBER_ID Varchar(10) ,BOOK_CODE Varchar(10) ,DATE_ISSUE Date ,DATE_RETURN Date ,DATE_RETURNED Date NULL,
FINE_RANGE Varchar(3),Constraint LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),Constraint LMS_Mem FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
Constraint LMS_BookDetail FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),Constraint LMS_FineDetail FOREIGN KEY(FINE_RANGE) References
LMS_FINE_DETAILS(FINE_RANGE));
DESCRIBE LMS_BOOK_ISSUE;

Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '22-02-1990', '20-05-2001','Temporary');
Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '04-04-2012', '07-04-2013','Temporary');
Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '13-05-2012','12-05-2013',
'Permanent');
Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '22-04-2012', '21-04-2013',
'Temporary');
Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '15-03-2012', '16-05-2013','Temporary');
Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '12-04-1012', '15-05-2013','Temporary');
select*from lms_members;

Insert into LMS_SUPPLIERS_DETAILS
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI',
9894123555,'sing@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM',
9444411222,'rose@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S05','EINSTEN BOOK GALLARY', 'US',
9542000001,'eingal@aol.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');
select*from LMS_SUPPLIERS_DETAILS;

Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);
select*from LMS_FINE_DETAILS;

Insert into LMS_BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel','Prentice Hall', '10-12-1999', 6, 600.00, 'A1', '10-05-2011', 'S01');
Insert into LMS_BOOK_DETAILS Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '10-
05-2011', 'S03');
Insert into LMS_BOOK_DETAILS Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-05-1999', 6, 600.00, 'A1', '10-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '11-
05-2012', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-12-1999', 6, 600.00, 'A1', '11-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '12-
05-2012', 'S03');
Insert into LMS_BOOK_DETAILS
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB
Publications', '11-12-2010', 9, 500.00 , 'A3', '13-11-2010', 'S03');
Insert into LMS_BOOK_DETAILS
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB
Publications', '12-05-2010', 9, 500.00 , 'A3', '09-08-2011', 'S04');
select*from LMS_BOOK_DETAILS;

Insert into LMS_BOOK_ISSUE
Values (001, 'LM001', 'BL000001', '01-05-2012', '16-05-2012', '16-
05-2012', 'R0');
Insert into LMS_BOOK_ISSUE
Values (002, 'LM002', 'BL000002', '01-05-2012', '06-05-2012','16-05-
2012', 'R2');
Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', '01-04-2012', '16-04-2012', '20-
04-2012','R1');
Insert into LMS_BOOK_ISSUE
Values (004, 'LM004', 'BL000005', '01-04-2012', '16-04-2012','20-04-
2012', 'R1');
Insert into LMS_BOOK_ISSUE
Values (005, 'LM005', 'BL000008', '30-03-2012', '15-04-2012','20-04-
2012' , 'R1');
Insert into LMS_BOOK_ISSUE
Values (006, 'LM005', 'BL000008', '20-04-2012', '05-05-2012','05-05-
2012' , 'R0');
Insert into LMS_BOOK_ISSUE
Values (007, 'LM003', 'BL000007', '22-04-2012', '07-05-2012','25-05-
2012' , 'R4');
select*from LMS_BOOK_ISSUE;
select * from lms_members;
select*from lms_book_details;
select*from lms_fine_details;
select*from lms_suppliers_details;

select book_code,publication,price,supplier_name from lms_book_details 
inner join lms_suppliers_details on lms_book_details.supplier_id=lms_suppliers_details.supplier_id
where book_code in
(select book_code from lms_book_issue group by book_code having count(lms_book_issue.book_issue_no)>=2);
--Problem # 1:
--Write a query to display the member id, member name, city and membership status who are all having life time membership.
--Hint: Life time membership status is “Permanent”.
SELECT MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS FROM LMS_MEMBERs WHERE membership_status='Permanent';
--Problem # 2:
--Write a query to display the book code, publication, price and supplier name of the book witch is taken frequently.
--select lms_book_details.book_code,lms_book_details.publication,lms_book_details.price,lms_suppliers_details.supplier_name 
--from lms_suppliers_details 
--inner join lms_book_details on lms_suppliers_details.supplier_id = lms_book_details.supplier_id;

select lms_book_details.book_code,lms_book_details.publication,price,supplier_name,count(lms_book_issue.book_issue_no) from lms_book_details
inner join lms_book_issue on lms_book_issue.book_code=lms_book_details.book_code
inner join lms_suppliers_details on lms_suppliers_details.supplier_id=lms_book_details.supplier_id as t
group by lms_book_details.book_code having count(lms_book_issue.book_issue_no)>=2;

select book_code,publication,price,lms_suppliers_details.supplier_name from lms_book_details
inner join lms_suppliers_details on lms_book_details.supplier_id=lms_suppliers_details.supplier_id
where book_code in
(select book_code from lms_book_issue group by book_code having count(book_issue_no)>=2); 


select book_code,publication,price,supplier_name
from lms_book_details
inner join lms_suppliers_details on lms_suppliers_details.supplier_id=lms_book_details.supplier_id
where  book_code in
(select book_code from lms_book_issue group by book_code having count(book_issue_no)>=2);

--Problem # 3:
--Write a query to display the member id, member name who have taken the book with book code 'BL000002'
--select lms_members.member_id,lms_members.member_name,lms_book_issue.book_code from lms_book_issue inner join lms_members on lms_book_issue.member_id=lms_members.member_id where book_code='BLOOOO02';
select  m.member_id,m.member_name,bi.book_code from lms_members m join lms_book_issue bi on m.member_id=bi.member_id where bi.book_code='BL000002';
select * from lms_book_details;
--Problem # 4:
--Write a query to display the book code, book title and author of the books whose author name begins with 'P'.

select lms_book_details.book_code,lms_book_details.book_title,lms_book_details.author from lms_book_details where author like 'P%';

--Problem # 5:
--Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’
select count(category)as no_of_books from lms_book_details where category='JAVA';

--Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.
select count(publication )as no_of_books from lms_book_details where publication='Prentice Hall';

--Problem # 8:
--Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".
--select bd.book_code,bd.book_title,bi.date_issue from lms_fine_details bd,lms_book_issue bi where
select lms_book_details.book_code,lms_book_details.book_title,lms_book_issue.date_issue from lms_book_issue join lms_book_details  on lms_book_issue.book_code=lms_book_details.book_code where 
date_issue='01-04-12' ;

--Problem # 9:
--Write a query to display the member id, member name, date of registration and expiry date of the members whose membership expiry date is before APR 2013.
select lms_members.member_id,lms_members.member_name,lms_members.date_register,lms_members.date_expire from lms_book_details where date_expire<'01-04-2013';


--Problem # 10:
--write a query to display the member id, member name, date of registration, membership status of the members who registered before  "March 2012" and membership status is "Temporary" 
select lms_members.member_id,lms_members.member_id,lms_members.date_register,lms_members.membership_status from lms_members where membership_status='Permanent' ;

--Problem #13:
--Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias name “AVERAGEPRICE”.
select  lms_book_details.category,lms_book_details.price,avg(price) as averageprice from lms_book_details where category='java';




