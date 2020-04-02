/* constraint */
create table table_name (
	column_name datatype constraint
);

/* not null constraint */
create table Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL,
	Age int
);

/* creating not null constraint on the existing table */
alter table Persons modify age int not null;

/* unique constraint */
create table Persons(
	ID int NOT NULL UNIQUE,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int
);

/* name a constrain*/
create table Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int, 
	CONSTRAINT UC_Person UNIQUE (ID, LastName)
);

/* Add constraint to the existing table*/
alter table Persons add UNIQUE(ID);

/* Add a constraint on multiple columns to the existing table */
alter table Persons add CONSTRAINT UC_Person UNIQUE(ID, LastName);

/*Drop a unique constraint*/
Alter table Persons drop CONSTRAINT UC_Person;

/* create Primary Key */
create table Persons(
	ID int NOT NULL PRIMARY KEY,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
);

/* multiple primary key constraints */
create table Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);

/* add primary key to the exsting column */
alter table Persons add PRIMARY KEY (ID);

/* set multiple columns primary key in the existing column */
alter table Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

/* Drop a primary key constraint */
alter table Persons drop PRIMARY KEY; 

/* Drop multiple constraint */
alter table Persons drop CONSTRAINT PK_Person;