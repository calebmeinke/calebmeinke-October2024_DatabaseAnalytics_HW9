-- Create "departments" table
CREATE TABLE departments (
    dept_no VARCHAR(6) NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

-- Create "titles" table
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(20) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

-- Create "employees" table
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR (20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no),
    CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

-- Create "dept_emp" table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(6) NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create "dept_manager" table
CREATE TABLE dept_manager (
    dept_no VARCHAR(6) NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create "salaries" table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no),
    CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);