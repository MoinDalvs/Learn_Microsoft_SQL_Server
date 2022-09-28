# Microsoft SQL Server Management System

![17 09 2022_15 09 13_REC](https://user-images.githubusercontent.com/99672298/192807483-a2e8a2b9-87eb-4e30-b576-119f59925370.png)
![17 09 2022_16 36 44_REC](https://user-images.githubusercontent.com/99672298/192807534-fa7530b3-7897-4d08-a534-3982dc8c0775.png)
![17 09 2022_16 37 39_REC](https://user-images.githubusercontent.com/99672298/192807562-58d74332-8ba4-4485-92e1-a4cc5076888b.png)
![17 09 2022_16 38 12_REC](https://user-images.githubusercontent.com/99672298/192807575-6b3272b8-171d-4d62-abcf-baa88b618ff5.png)
![18 09 2022_14 25 42_REC](https://user-images.githubusercontent.com/99672298/192807590-2d0eee9f-eea3-41e6-8935-d7879a297a7a.png)
![18 09 2022_14 31 33_REC](https://user-images.githubusercontent.com/99672298/192807603-89b40e20-9466-450a-8bb4-6756b73c64af.png)
![18 09 2022_14 33 27_REC](https://user-images.githubusercontent.com/99672298/192807612-cea5b34f-dd95-4136-9d74-dfbe8280f59a.png)
![18 09 2022_14 35 46_REC](https://user-images.githubusercontent.com/99672298/192807627-b9fc5b70-62e5-4948-897a-46146cb14136.png)
![18 09 2022_14 37 58_REC](https://user-images.githubusercontent.com/99672298/192807678-65225295-b28a-4d97-a538-7ac57aafd6b6.png)
![18 09 2022_14 39 00_REC](https://user-images.githubusercontent.com/99672298/192807713-e94f6cc8-8269-45f7-8458-51bcb51393e0.png)
![18 09 2022_14 39 59_REC](https://user-images.githubusercontent.com/99672298/192807756-cb1d0941-9d51-4a4b-8e2c-128a4fc7c7c3.png)
![18 09 2022_14 40 46_REC](https://user-images.githubusercontent.com/99672298/192807768-d9c06414-0f29-426a-bd78-c0c973e247b5.png)
![18 09 2022_14 41 15_REC](https://user-images.githubusercontent.com/99672298/192807810-45a20ce5-9974-41dd-8364-c8a7a206ebf2.png)
![18 09 2022_15 43 53_REC](https://user-images.githubusercontent.com/99672298/192807836-f9e18c8f-1c18-4a71-ace1-9479e427c1cf.png)

### How to create database

    create database Test;

### How to delete a database

    drop database Test;

### How to use database

    use Test

### Creating table with columns (not inserting values)

    create table emp_details
    (emp_id int,
    first_name varchar(20) not null,
    last_name varchar(20) not null);

## How to view all rows and column in a database

    select * from emp_details;

## How to rename column in SQL Server (microsoft sql server)

    EXEC sp_rename 'emp_details.emp_id', 'Emp_Id';

-- Alter table command which helps to add constraints or add column or modify in an already existing table

    alter table emp_details add age int;

    alter table emp_details alter column age varchar(5);

    alter table emp_details alter column age varchar(5) not null;

    alter table emp_details drop column age;

    alter table emp_details add salary numeric (10,2);

    alter table emp_details drop column salary;

### How to delete table from a database

    drop table emp_details;

### Again creating table with column names

    create table emp_details
    ( emp_id int primary key,
    last_name varchar (20) not null,
    first_name varchar(20) not null);

    drop table emp_details;

### How to add primary key constraint while creating table in database

    create table emp_details
    ( emp_id int,
    first_name varchar(20),
    last_name varchar(20),
    constraint emp_pk primary key (emp_id)
    );

    drop table emp_details;

### Different method to add primary key constraint while creating table and adding column names to it

    create table emp1
    ( first_name varchar(20),
    last_name varchar(20),
    salary money,
    constraint emp1_pk primary key (first_name, last_name)
    );

    drop table emp1;

### How to add primary key constraint after creating a table with column names

    create table emp2
    ( emp_id int not null,
    first_name varchar(20),
    last_name varchar(20));

    alter table emp2
    add constraint emp2_pk primary key (emp_id);

    drop table emp2;

### How to drop constraint from a table

    ALTER TABLE emp2 DROP CONSTRAINT emp2_pk;

### How to drop multiple tables

    drop table emp1, emp2;

### How to create parent table with primary key

    create table product
    (prod_id int primary key,
    prod_name varchar(25),
    categary varchar(40)
    );

### How to add foreign key while creating child table with reference to primary key of parent table

    create table orders
    (order_id int primary key,
    prod_id int not null,
    quantity int,
    constraint fk_product_id foreign key (prod_id)
    references product (prod_id)
    );

### How to add foreign key after creating a child table

    create table product1
    (prod_id int primary key,
    prod_name varchar(25),
    categary varchar(40)
    );

    create table orders1
    (order_id int primary key,
    prod_id int not null,
    quantity int
    );

    alter table orders1
    add constraint fk_product_id1
    foreign key (prod_id)
    references product1 (prod_id);

    drop table product1;-- You will get an error "Could not drop object 'product1' because it is referenced by a FOREIGN KEY constraint."

    ### How to delete parent table and child table

    drop table orders1;
    drop table product1;

### On delete cascade will delete foreign key data from both parent as well as child table

    create table product1
    (prod_id int primary key,
    prod_name varchar(25),
    categary varchar(40)
    );

    create table orders1
    (order_id int primary key,
    prod_id int not null,
    quantity int
    );

    alter table orders1
    add constraint fk_product_id1
    foreign key (prod_id)
    references product1(prod_id)
    on delete cascade;

    drop table product1; -- you will still get an error but if you delete data from parent table this will delete data from child table as well

    drop table "orders1", product1;

    select * from product1;

### Various Constraints example

    create table employee(
    emp_id numeric(4) primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    mgr_id numeric(4) not null,
    phone_number varchar(10) unique,
    job_id numeric(2),
    deptno numeric(2));
