Create  TABLE Employees(  EmployeeID INT IDENTITY, 
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

		 
		; WITH CTE AS  

(  SELECT EmployeeID, EmployeeName, Department, 
  DENSE_RANK() OVER 
                 ( 
                   PARTITION BY department 
                   ORDER BY salary DESC                 
                 ) AS 'RANK', salary 
  FROM Employees
)
SELECT EmployeeID, EmployeeName, Department, Salary 
FROM cte 
WHERE [RANK] = 2; 