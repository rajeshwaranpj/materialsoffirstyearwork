create table Employees (
EmployeeID INT IDENTITY,
EmployeeName VARCHAR(15),
Department VARCHAR(15),
Salary NUMERIC(16,2)
)


INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('T Cook','Finance', 40000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('D Michael','Finance', 25000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('A Smith','Finance', 25000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('D Adams','Finance', 15000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('M Williams','IT', 80000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('D Jones','IT', 40000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('J Miller','IT', 50000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('L Lewis','IT', 50000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('A Anderson','Back-Office', 25000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('S Martin','Back-Office', 15000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('J Garcia','Back-Office', 15000)
INSERT INTO Employees(EmployeeName, Department, Salary)
VALUES('T Clerk','Back-Office', 10000)

select * from Employees

SELECT MAX(Salary) From Employees WHERE Salary < ( SELECT Max(Salary) FROM Employees);


--;with t as
--(
--select *,
--       dense_rank() over (order by salary desc) as rnk
--from Employees
--)
--select EmployeeName, EmployeeID,Salary,Department
--from t
--where rnk=2;





select * from Employees e1 where 2 = ( select count(distinct e2.Salary)
from Employees e2
where e2.Department = e1.Department
and e2.Salary >= e1.Salary)
order by
Department, e1.Salary,e1.EmployeeID





