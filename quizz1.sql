/* create table students
	(id int primary key,
	firstName varchar(30) not null,
	lastName varchar(30) not null);
	*/

/* Q : write a query that returns the number of students whose
first name is John, String comparisons should be case sensitive.*/

select count(id) from students where firstName = 'John';

/* create table enrollments 
	 (id int not null primary key,
	 year int not null,
	 studentid int not null); */

/* write a query that updates the field 'year' of every faulty 
record to 2015 for ids between 20 and 100*/

update enrollments set year = 2015 where id between 20 and 100;

/* information about pets is kept in two separate tables called
'dogs' and 'cats'. Write a query that select all distinct pet names
*/
/* create table dogs (
	id int not null primary key,
	name varchar(50) not null
);

create table cats(
	id int not null primary key,
	name varchar(50) not null	
);
*/
select distinct name from (select name from dogs union select name from cats);

/* write a query that selects the names of employees who are 
not managers*/
/* create table employees
	(id int not null primary key,
	managerid int references empoyees(id)
	name varchar(30) not null);
*/

select employees.name from employees where not in (select e1.id from employees as e1, employees as e2 where e1.id = e2.managerid);

/* write an sql query to fetch 'FIRST_NAME' from 
'worker' table using the alias name as 'WORKER_NAME'*/

select FIRST_NAME as WORKER_NAME from worker;

/* write an sql query to print details of workers
excluding first names('first_name'). 'Vipul' and 'Satish' from 
'worker' table.
*/

select * from workers where firs_name not in('Vipul' and 'Satish');

/* what is a sql command to remove row of data in a table? */
/*A: delete */

/* How can you select all the even number records from a tabel? */

/* assume that the table name is 'person' which has 'id' int primary key 
auto_increment column*/

select * from person where id % 2 = 0;

/* Query all 'person' whose 'first_name' is 'john' case insensitive*/

select * from person where first_name like 'john';

/* select * from person where age > 18 ordered by id desc;
Find the bug and rewrite the correct query */

select * from person where age > 18 order by id desc;

/* print the rows which have 'Yellow' in one of the columns,
C1, C2, or C3 but without using OR. */
select * from table_name where 'yellow' in (C1, C2, C3);

/* given a table 'A' with exactly one INT column named 'x', write
a single query that returns sum of all positive vaues as 'sum_of_pos'
, and sum of all negative values as 'sum_of_neg'
*/
select sum(case when x > 0 then x else 0 end) as sum_of_pos, sum(case when x < 0 then - 1 * x else 0 end) as sum_of_neg from A;

/* Weight kg gms */
select weight, floor(kg) as kg, (weight - floor(weight)) * 1000 as gms from mass_table;


/* write a query to display the last name, job, salary for
all employees whose job is that of a programmer or a shipping clerk
and whose salary is not equal to $4500, $ 10 000 or $ 15 000
*/

select last_name, job, salary from employees salary not in (4500, 10000, 15000) where and job_id = (select job_id from jobs where job_title in ('Programmer', 'Shipping Clerk'));

/* write a query to display the name(first_name, last_name) and
salary for all employees whose salary is not in the range $ 10 000 through $ 15 000 */

select first_name, last_name, salary from employees where salary not between 10000 and 15000;

/* write a query to select all record from employees 
where last_name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'*/

select * from employees where last_name in ('BLAKE', 'SCOTT', 'KING', 'FORD');

/* write a query to display the name(first_name, last_name), salary and PF(15 % of salary) of all employees*/

select first_name, last_name, salary* 0.15 as pf from employees;

/* write a query to list the number of jobs available in
the employees table*/

select count(distinct job_id) from employees;

/* write a query to get the maximum salary of an employee 
working as a Programmer*/

select max(salary) from employees where job_id = (select job_id from jobs and job_title = 'Programmer');

/* write a query to get the average salary and number of employees working the department 90 */

select avg(salary) as average_salary, count(distinct employee_id) as number_of_empoloyees from employees where department_id = 90;

/* write a query to find the manager ID and salary of the lowest paid employee for that manager*/

select manager_id, min(salary) from employees group by manager_id;

/* write a query to get job id and maximum salary of the employees where maximum salary is greater than or equal to $ 4000 */

select job_id, max_salary from jobs where max_salary >= 4000;

/* write a query to find the name(first_name, last_name) and 
hire date of the employees who hired after 'Jones'.
*/

select first_name, last_name, hire_date from employees where hire_date > (select hire_date from employees where first_name = 'Jones' or last_name = 'Jones');

/* write a query to display the department id and name and first name of manager*/

select department_id, department_name from departments where manager_id = (select manager_id from employees);

/* write a query to find the addresses
(location_id, street_address, city, state_province, country_name) of 
all the departments
*/

/* write a sql statement to increase the salary of 
employees under the department 40, 90 and 110 
according to the company rules that salary will be increased 
by 25% for the department 40 ,
15 % for the department  90 and
10 % for the department  110 
and the rest of the departments wil remain same.*/

update employees set salary = 
case when
department_id = 40 then salary + (salary * 0.25) 
department_id = 90 then salary + (salary * 015)
department_id = 110 then salary +(salary * 0.10)
else
salary 
end
where department_id in(40, 90, 110);