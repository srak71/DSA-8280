ALTER SCHEMA employees_mod  DEFAULT COLLATE utf8_bin ;
ALTER TABLE employees_mod.t_employees CONVERT TO CHARACTER SET UTF8MB3;
ALTER TABLE employees_mod.t_departments CONVERT TO CHARACTER SET UTF8MB3;
ALTER TABLE employees_mod.t_dept_emp CONVERT TO CHARACTER SET UTF8MB3;
ALTER TABLE employees_mod.t_dept_manager CONVERT TO CHARACTER SET UTF8MB3;
ALTER TABLE employees_mod.t_salaries CONVERT TO CHARACTER SET UTF8MB3;