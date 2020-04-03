/* foreign key */
create table orders(
	OrderID int NOT NULL,
	OrderNumber int NOT NULL,
	PersonID int,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
);

/* alter foreign key */
alter table orders add FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

/* drop a foreign key */
alter table orders drop FOREIGN KEY FK_PersonOrder;

/* check */
-- to limit the value range that can be placed in a column
create table Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	CHECK (Age >= 18)
);

/* alter check for already created table */
alter table Persons ADD CHECK (Age >= 18);

/* multiple check */
alter table Persons ADD CONSTRAINT CHK_PersonAge CHECK (Age >= 18 AND City = 'Sadness');

/* drop a check constraint */
alter table Persons drop CHECK CHK_PersonAge;

/* sql default constraint */
create table Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int, 
	City varchar(255) DEFAULT 'Sadness'
);

/* insert value with the default constraint GETDATE() */
create table orders(
	ID int NOT NULL,
	OrderNumber int NOT NULL,
	OrderDate date DEFAULT GETDATE()
);

/* default constraint to the already created table */
alter table Persons alter city SET DEFAULT 'sadness';

/* Drop default constraint */
alter table Persons alter city DROP default;

/* create index */
-- index are used to retrieve data from the DB more quickly than otherwise.
CREATE INDEX index_name ON table_name(column_name);

/* create unique index */
create unique index index_name on table_name(column_name);

/* create index example */
create index idx_lastname on Persons(LastName);

/* index on a combination of columns */
create index idx_lastname on Persons(LastName, FirstName);

/* drop index statement */
alter table table_name drop index index_name;

/* drop index example */
alter table Persons drop index idx_lastname;

/* auto increment field */
create table Persons(
	PersonID int NOT NULL AUTO_INCREMENT,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	PRIMARY KEY(PersonID)
);

/* AUTO_INCREMENT with the starting value */
alter table Persons AUTO_INCREMENT = 100;
-- alter table table_name auto_increment = starting_value;

/* Dates */
-- Date 		: YYYY-MM-DD
-- DateTime 	: YYYY-MM-DD HH:MI:SS
-- TimeStamp 	: YYYY-MM-DD HH:MI:SS
-- Year 		: YYYY or YY

/* create view syntax*/
create view view_name as select column_name from table_name where condition;

/* create view example */
create view [Brazil Customers] as select CustomerName, ContactName from Customers where Country = 'Brazil';

/* how to view the view table*/
select * from [Brazil Customers];

/* SQL updating a view */
create or replace view view_name as select column_name from table_name where condition;

/* updating the view */
create or replace view [Brazil Customers] as select CustomerName, ContactName, City From Cutomers Where Country = 'Brazil';

/* dropping a view */
Drop view view_name;

/* Dropping example */
Drop view [Brazil Customers];	