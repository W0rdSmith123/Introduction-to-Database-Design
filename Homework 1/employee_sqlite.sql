-- Create a SQLite table

  Drop table employees; 
  Drop table departments;
  
-- a.  Create a table named Department insert 4 departments into the table
 CREATE TABLE departments( dept        integer,  
                            name        text
 			              );

  INSERT INTO departments VALUES (1,'Accounting');
  INSERT INTO departments VALUES (2,'Shipping');
  INSERT INTO departments VALUES (3,'Sales');
  INSERT INTO departments VALUES (4,'Tech Support'); 
  
  
-- b.  Create a table named Employees and insert 14 employees into the table
  CREATE TABLE employees( id          integer,  
                        name        text,
                        designation text, 
 						manager     integer,
                        hired_on    date,
						salary      integer,
                        commission  float,
						departments integer
		       );

  INSERT INTO employees VALUES (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4);
  INSERT INTO employees VALUES (2,'HARDING','MANAGER',9,'1998-02-02',52000,300,3);
  INSERT INTO employees VALUES (3,'TAFT','SALES I',2,'1996-01-02',25000,500,3);
  INSERT INTO employees VALUES (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3);
  INSERT INTO employees VALUES (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4);
  INSERT INTO employees VALUES (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4);
  INSERT INTO employees VALUES (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4);
  INSERT INTO employees VALUES (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2);
  INSERT INTO employees VALUES (9,'JACKSON','Tech',NULL,'1990-01-01',75000,NULL,4);
  INSERT INTO employees VALUES (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2);
  INSERT INTO employees VALUES (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2);
  INSERT INTO employees VALUES (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4);
  INSERT INTO employees VALUES (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2);
  INSERT INTO employees VALUES (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);

-- c.  Execute the following query statements against the employees table.

  Select * from departments; 
  Select * from employees; 
 

  SELECT designation, COUNT(*) AS nbr, (AVG(salary)) AS avg_salary 
    FROM employees GROUP BY designation 
    ORDER BY avg_salary DESC;

  SELECT name, hired_on FROM employees ORDER BY hired_on;

-- d.  Execute the following query statement against Sqlite system catalog

  Select * from sqlite_master;     
