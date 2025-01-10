CREATE database EMP_MGMT;
SHOW DATABASES;
use EMP_MGMT;
show tables;

CREATE TABLE `emp_mgmt`.`emp` (
  `empid` INT NOT NULL AUTO_INCREMENT,
  `empname` VARCHAR(1000) NOT NULL,
  `citempy` VARCHAR(100) NULL,
  PRIMARY KEY (`empid`));

CREATE TABLE `emp_mgmt`.`dept` (
  `deptid` INT NOT NULL AUTO_INCREMENT,
  `deptname` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`deptid`));
  
show tables;

INSERT INTO `emp_mgmt`.`emp` (`empid`, `empname`, `city`) VALUES ('1', 'Ashwin', 'Mumbai');
INSERT INTO `emp_mgmt`.`emp` (`empid`, `empname`, `city`) VALUES ('2', 'Shweta', 'Panvel');

INSERT INTO `emp_mgmt`.`dept` (`deptid`, `deptname`) VALUES ('50', 'IT');
INSERT INTO `emp_mgmt`.`dept` (`deptid`, `deptname`) VALUES ('51', 'BANK');
INSERT INTO `emp_mgmt`.`dept` (`deptname`) VALUES ('HR');
