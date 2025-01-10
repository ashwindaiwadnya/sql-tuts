select * from emp;
select * from dept;
select * from orders;

select e.empid,e.empname,e.city,d.deptname 
from emp e
join dept d on e.deptid=d.deptid;

select e.empname as Employee,d.deptname as Dept, o.orderrname as OrderItem
from emp e
join dept d on e.deptid=d.deptid
join orders o on e.empid=o.orderempid;

select e.empname as employee, deptname as Department
from emp e
right join dept d 
on e.deptid=d.deptid;

select e.empname as employee, deptname as Department
from emp e
left join dept d 
on e.deptid=d.deptid;

select e.empname as employee, deptname as Department
from dept d
right join emp e 
on e.deptid=d.deptid;

select e.empid,e.empname,COALESCE(d.deptname, 'No dept assingned')  from emp e LEFT JOIN dept d on e.deptid=d.deptid
UNION
select e.empid,COALESCE(e.empname, 'No emp in this dept') ,d.deptname from emp e RIGHT JOIN dept d on e.deptid=d.deptid;

select e.empname, e.city, em.empname,em.city 
from emp e, emp em
where e.city <> em.city
order by e.empname;

select count(e.empid), e.city
from emp e
group by e.city;

select count(e.empid) as NoOfOrderByEmp, e.city as city, o.orderrname as OrderedItem
from emp e
right join orders o on e.empid=o.orderempid
group by city,OrderedItem
having e.city='Mumbai' AND o.orderrname like 's%';


SELECT m.empname FROM emp m, emp e where e.managerid=e.managerid;
select * from emp;
SELECT e.empname empoyee, m.empname manager
FROM emp e
JOIN emp m ON e.managerid = m.empid
where managerid in ( select managerid from emp where count(managerid) > 2 );

 SELECT managerid, COUNT(managerid) AS cnt
    FROM emp
    GROUP BY managerid;
    
WITH EMPMANGER AS (  
WITH mgrcnt AS (
    SELECT managerid, COUNT(managerid) AS cnt
    FROM emp
    GROUP BY managerid
) select * from emp where managerid in (select managerid from mgrcnt where cnt >= 2)) 
select em.empname as Emp, e.empname as Mgr from EMPMANGER em join emp e on em.managerid=e.empid ;

WITH CountCTE AS (
    SELECT managerid, empname, COUNT(managerid) AS cnt
    FROM emp
    GROUP BY managerid, empname
) select e.empname as Employee, ct.empname 
from emp e join CountCTE ct on e.managerid=ct.managerid where cnt >= 2;

WITH CountCTE AS (
    SELECT managerid, COUNT(managerid) AS cnt
    FROM emp
    GROUP BY managerid
) select managerid from CountCTE where cnt >= 2;