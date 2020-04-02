/* create db */
create database databasename;

/* drop db */
drop database databasename;

/* backup */
backup database databasename to disk = 'filepath';

/* Differential backup */
/* .bak = backup file */
backup database databasename to disk = 'filepath' with Differential;

/* create table */
create table table_name(
	column_name datatype,
);

/* example */
create table persons (
	PersonID int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

/* create table using an exsiting tabel*/
create table new_table_name as 
	select column_name
	from exsiting_table_name
	where ...;

/* example */
create table TestTable as
	select customername, contactname
	from customers;


/* drop table */
drop table table_name;

/* turncate table = to delete the data inside a table */
turncate table table_name;

/* alter table - add col */
alter table table_name add column_name datatype;

/* example */
alter table customers add email varchar(255);

/* delete column */
alter table table_name drop column column_name;

/* example */
alter table customers drop column email;

/* chage column data */
alter table table_name alter column column_name datatype;

/* prior version 10 G */
alter table table_name modify column column_name datatype;

/* add column example */
alter table Persons add column DateOfBirth date;

/* change column datatype */
alter table Persons alter column DateOfBirth year;

/* delete column example */
alter table Persons drop column DateOfBirth;




