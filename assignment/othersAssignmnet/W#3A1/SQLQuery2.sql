create  TABLE Person(PersonId INT,PersonName VARCHAR(20)) 
INSERT INTO Person 
SELECT 1,'Deepak Kumar Goyal' UNION ALL
SELECT 2,'Niladri Biswas' 
SELECT * FROM Person
create TABLE ContactDetail(PersonId INT,MobileNumber VARCHAR(100))
INSERT INTO ContactDetail
SELECT 1, '9886551234,9445612356' UNION ALL  
SELECT 2,'9886334510' 



SELECT * FROM ContactDetail

SELECT p.PersonId,p.PersonName , c.MobileNumber , len(MobileNumber)-  len(REPLACE(MobileNumber,',',''))+1 as Recordcount

from Person as p, ContactDetail as c

where p.PersonId=  c.PersonId   

select COUNT((MobileNumber)) from ContactDetail