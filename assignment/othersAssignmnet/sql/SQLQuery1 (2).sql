create table Person (PersonId INT,PersonName VARCHAR(20))

INSERT INTO Person
SELECT 1,'Deepak Kumar Goyal' UNION ALL
SELECT 2,'Niladri Biswas'



create table ContactDetail (PersonId INT,MobileNumber VARCHAR(100))

INSERT INTO ContactDetail
SELECT 1, '9886551234,9445612356' UNION ALL
SELECT 2,'9886334510'

SELECT * FROM ContactDetail
SELECT * FROM Person

SELECT P.PersonId,P.PersonName,C.MobileNumber,LEN(MobileNumber)- LEN(REPLACE(MobileNumber,',',''))+1 RecordCount FROM Person P
INNER JOIN ContactDetail  C ON P.PersonId = C.PersonId