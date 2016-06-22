create  TABLE tmpData( ID INT, NAME VARCHAR(MAX) )

INSERT INTO tmpData (ID,[NAME]) SELECT 1, 'Deepak Kumar Goyal'
 INSERT INTO tmpData (ID,[NAME]) SELECT 2, 'Niladri Biswas'
  INSERT INTO tmpData (ID,[NAME]) SELECT 2, 'Pratik Shaw' 
  INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Sumi Girijan'
   INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Suresh Beldar'
    INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Jeeva Baby'  



	WITH CONCAT_CTE AS
(
      SELECT ID, Name, 1 AS [ID_Count]
      FROM  tmpData 
    UNION   ALL
      SELECT T.ID, C.Name + ' , ' + T.Name, [ID_Count] + 1
      FROM  tmpData T
     INNER JOIN CONCAT_CTE C ON T.ID = C.ID
      WHERE PATINDEX('%' + T.NAME + '%' ,C.Name) = 0
)

SELECT ID,
CASE WHEN MAX(ID_Count) = 1 THEN MAX(Name)
WHEN MAX(ID_Count) = 2 THEN REPLACE(MAX(NAME), ',', ' OR ')
WHEN MAX(ID_Count) > 2 THEN REPLACE(MAX(NAME), ',', ' AND ')
                  END AS [Name]
FROM        CONCAT_CTE
GROUP BY    ID
ORDER BY    ID;