-- Database: Demo 

-- DROP DATABASE "Demo ";

CREATE DATABASE "Demo "
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
drop TABLE dcustomer;
                    ------------------Creating Table--------------------
CREATE TABLE dcustomer
   (
       custid VARCHAR(6)  PRIMARY KEY,
       fname VARCHAR(50),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       age Int,
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE);  
   
                      -------------------Adding Vales----------------------
					  
INSERT INTO dcustomer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi',45,'9543198345','Service','1976-12-06');
INSERT INTO dcustomer VALUES('C00002','Avinash','Sunder','Minha','Delhi',32,'9876532109','Service','1974-10-16');
INSERT INTO dcustomer VALUES('C00003','Rahul',null,'Rastogi','Delhi',24,'9765178901','Student','1981-09-26');
INSERT INTO dcustomer VALUES('C00004','Parul',null,'Gandhi','Delhi',46,'9876532109','Housewife','1976-11-03');
INSERT INTO dcustomer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai',23,'8976523190','Service','1976-09-19');
INSERT INTO dcustomer VALUES('C00006','Chitresh',null,'Barwe','Mumbai',18,'7651298321','Student','1992-11-06');
INSERT INTO dcustomer VALUES('C00007','Amit','Kumar','Borkar','Mumbai',76,'9875189761','Student','1981-09-06');
INSERT INTO dcustomer VALUES('C00008','Nisha',null,'Damle','Mumbai',43,'7954198761','Service','1975-12-03');
INSERT INTO dcustomer VALUES('C00009','Abhishek',null,'Dutta','Kolkata',67,'9856198761','Service','1973-05-22');
INSERT INTO dcustomer  VALUES('C00010','Shankar',null,'Nair','Chennai',90,'8765489076','Service','1976-07-12');
                  
				   ----------------Aggregate Fuctions-------------------
Select * From dcustomer;

----finding Min age among all customer 

select min(age) from dcustomer;

---whats is the name of person whoes age is min
select fname from dcustomer where age = 18;

---what is the max age of customer in the data
select max(age)  from dcustomer;

----Name of person whose age is Maximum
select fname from dcustomer where age = 90;

---How many enteies are in data
select  count(*) from dcustomer;

---give name total_customer of the total value of the data
select count(age) as total_customer from dcustomer;

---How many customers are from Delhi and give cloumn heading as Cutomer_form_Delhi
select count(fname) as customer_from_Delhi from dcustomer where city ='Delhi';

---find the avg age in dataset
select avg(age) as average_age from dcustomer;

----Sum of all ages
select sum(age) as sum_of_age from dcustomer;


                       --------------------Group By Function--------------
---find total no for customer from each cities
Select count(fname),city from dcustomer group by city;

                      -------------------Comparison Operators and Having Function--------------
---find cities where there are more than 2 customer
Select count(fname),city from dcustomer group by city Having count(fname)>=2 ;

---find cities where there are less than 2 customer
Select count(fname),city from dcustomer group by city Having count(fname)<=2 ;

---find cities where there are only(excatly) 1 customer
Select count(fname),city from dcustomer group by city Having count(fname)=1 ;

---find cities where customer count is not eqaual to 1
Select count(fname),city from dcustomer group by city Having count(fname)!=1 ;

---delecting data table 
drop table dcustomer;
                           -----------------------------Joins In Sql---------------------

drop Table customer;
drop Table account;
CREATE TABLE customer
   (
       custid VARCHAR(6),
       fname VARCHAR(30),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
	   age Int,
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE,
      CONSTRAINT customer_custid_pk PRIMARY KEY(custid)   
   );  

CREATE TABLE account
   (
      acnumber VARCHAR(6),
      custid  VARCHAR(6),
      bid VARCHAR(6),
      opening_balance INT,
      aod DATE,
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid)
      
      
    );

INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi',45,'9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sunder','Minha','Delhi',32,'9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi',24,'9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Parul',null,'Gandhi','Delhi',46,'9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai',23,'8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Chitresh',null,'Barwe','Mumbai',18,'7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Amit','Kumar','Borkar','Mumbai',76,'9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Nisha',null,'Damle','Mumbai',43,'7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Abhishek',null,'Dutta','Kolkata',67,'9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Shankar',null,'Nair','Chennai',90,'8765489076','Service','1976-07-12');


INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');


Select * from customer;
Select * from account;

---check total no of acc based on astatus
Select count(acnumber),astatus from account group by astatus;
select count(*) from customer;
select count(*) from account;
                                      ----joints-----
---Inner join 
Select fname,acnumber from customer inner join account on customer.custid=account.custid;

---Left joint 
select fname,acnumber from customer left join account on customer.custid = account.custid;

---Right joint
select fname,acnumber from customer right join account on customer.custid = account.custid;

---full joint 
select fname,acnumber from customer full outer join account on customer.custid = account.custid;

---another method for full join
SELECT * FROM customer
LEFT JOIN account ON customer.custid = account.custid
UNION
SELECT * FROM customer
RIGHT JOIN account ON customer.custid = account.custid;



                                        ------ Subquaries/Multiple quaries ----
--changing age from 45 to 47 

Update customer 
Set age = 47 where age in
(Select age from customer where age=45);

select * from customer;

--- find all customers  whose age is grather than 25 based on their cusotmer id 
Select * from customer 
Where custid
in(Select custid from customer where age>=25);


Select * from customer where age>25;   ---Alternate way 


---find accnumber of custoemr who belong to Delhi 
Select acnumber from account
where custid = any (Select custid from customer where city='Delhi');


Select acnumber from account
where custid = all (Select custid from customer where city='Delhi');

                                             --------Case and End---------
SELECT custid, fname,age,
CASE
    WHEN age > 30 THEN 'The age is greater than 30'
    WHEN age = 30 THEN 'The age is 30'
    ELSE 'The age is not group of 30'
END AS Age
FROM customer;

SELECT fname, city, age
FROM customer
ORDER BY
(CASE
    WHEN City IS NULL THEN 'no city'
    ELSE City
END);
