create table Fact (Nums INT)

INSERT INTO Fact
SELECT 0 UNION ALL
SELECT 1 UNION ALL
SELECT 3 UNION ALL
SELECT 5 UNION ALL
SELECT 10

SELECT * FROM Fact

;with factorial as
(
select 0 as nums, 1 as temp
union all
select nums+1, temp*(nums+1)
from factorial where nums < 10 
)
select distinct nums, temp
from factorial    
where nums in (select nums from Fact)