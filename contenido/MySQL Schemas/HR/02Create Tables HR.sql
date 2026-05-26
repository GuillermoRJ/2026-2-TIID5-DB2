
CREATE TABLE IF NOT EXISTS job_grades (
  Grade_Level varchar(3) NOT NULL,
  Lowest_Sal int(11) DEFAULT NULL,
  Highest_Sal int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Grades of salary';


CREATE TABLE IF NOT EXISTS jobs (
  JOB_ID varchar(10) NOT NULL COMMENT 'Primary key of jobs table.',
  JOB_TITLE varchar(35) NOT NULL COMMENT 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT',
  MIN_SALARY decimal(6,0) DEFAULT NULL COMMENT 'Minimum salary for a job title.',
  MAX_SALARY decimal(6,0) DEFAULT NULL COMMENT 'Maximum salary for a job title'
);


CREATE TABLE IF NOT EXISTS regions (
  REGION_ID int(11) NOT NULL,
  REGION_NAME varchar(25) DEFAULT NULL
);


CREATE TABLE IF NOT EXISTS countries (
  COUNTRY_ID char(2) NOT NULL COMMENT 'Primary key of countries table.',
  COUNTRY_NAME varchar(40) DEFAULT NULL COMMENT 'Country name',
  REGION_ID int(11) DEFAULT NULL COMMENT 'Region ID for the country. Foreign key to region_id column in the departments table.'
);


CREATE TABLE IF NOT EXISTS locations (
  LOCATION_ID decimal(4,0) NOT NULL COMMENT 'Primary key of locations table',
  STREET_ADDRESS varchar(40) DEFAULT NULL COMMENT 'Street address of an office, warehouse, or production site of a company.\r\nContains building number and street name',
  POSTAL_CODE varchar(12) DEFAULT NULL COMMENT 'Postal code of the location of an office, warehouse, or production site\r\nof a company. ',
  CITY varchar(30) NOT NULL COMMENT 'A not null column that shows city where an office, warehouse, or\r\nproduction site of a company is located. ',
  STATE_PROVINCE varchar(25) DEFAULT NULL COMMENT 'State or Province where an office, warehouse, or production site of a\r\ncompany is located.',
  COUNTRY_ID char(2) DEFAULT NULL COMMENT 'Country where an office, warehouse, or production site of a company is\r\nlocated. Foreign key to country_id column of the countries table.'
);

-- MANAGER_ID
CREATE TABLE IF NOT EXISTS departments (
  DEPARTMENT_ID decimal(4,0) NOT NULL COMMENT 'Primary key column of departments table.',
  DEPARTMENT_NAME varchar(30) NOT NULL COMMENT 'A not null column that shows name of a department. Administration,\r\nMarketing, Purchasing, Human Resources, Shipping, IT, Executive, Public\r\nRelations, Sales, Finance, and Accounting. ',
  MANAGER_ID decimal(6,0) DEFAULT NULL COMMENT 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.',
  LOCATION_ID decimal(4,0) DEFAULT NULL COMMENT 'Location id where a department is located. Foreign key to location_id column of locations table.'
);

-- EMPLOYEE-ID  job-id  department-id
CREATE TABLE IF NOT EXISTS job_history (
  EMPLOYEE_ID decimal(6,0) NOT NULL COMMENT 'A not null column in the complex primary key employee_id+start_date.\r\nForeign key to employee_id column of the employee table',
  START_DATE date NOT NULL COMMENT 'A not null column in the complex primary key employee_id+start_date.\r\nMust be less than the end_date of the job_history table. (enforced by\r\nconstraint jhist_date_interval)',
  END_DATE date NOT NULL COMMENT 'Last day of the employee in this job role. A not null column. Must be\r\ngreater than the start_date of the job_history table.\r\n(enforced by constraint jhist_date_interval)',
  JOB_ID varchar(10) NOT NULL COMMENT 'Job role in which the employee worked in the past; foreign key to\r\njob_id column in the jobs table. A not null column.',
  DEPARTMENT_ID decimal(4,0) DEFAULT NULL COMMENT 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table'
);

-- MANAGER_ID  job-id   department-id  
CREATE TABLE IF NOT EXISTS employees (
  EMPLOYEE_ID decimal(6,0) NOT NULL COMMENT 'Primary key of employees table.',
  FIRST_NAME varchar(20) DEFAULT NULL COMMENT 'First name of the employee. A not null column.',
  LAST_NAME varchar(25) NOT NULL COMMENT 'Last name of the employee. A not null column.',
  EMAIL varchar(25) NOT NULL COMMENT 'Email id of the employee',
  PHONE_NUMBER varchar(20) DEFAULT NULL COMMENT 'Phone number of the employee; includes country code and area code',
  HIRE_DATE date NOT NULL COMMENT 'Date when the employee started on this job. A not null column.',
  JOB_ID varchar(10) NOT NULL COMMENT 'Current job of the employee; foreign key to job_id column of the\r\njobs table. A not null column.',
  SALARY decimal(8,2) DEFAULT NULL COMMENT 'Monthly salary of the employee. Must be greater\r\nthan zero (enforced by constraint emp_salary_min)',
  COMMISSION_PCT decimal(2,2) DEFAULT NULL COMMENT 'Commission percentage of the employee; Only employees in sales\r\ndepartment elgible for commission percentage',
  MANAGER_ID decimal(6,0) DEFAULT NULL COMMENT 'Manager id of the employee; has same domain as manager_id in\r\ndepartments table. Foreign key to employee_id column of employees table.\r\n(useful for reflexive joins and CONNECT BY query)',
  DEPARTMENT_ID decimal(4,0) DEFAULT NULL COMMENT 'Department id where employee works; foreign key to department_id\r\ncolumn of the departments table'
);

