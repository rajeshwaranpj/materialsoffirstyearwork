SET NOCOUNT ON
IF OBJECT_ID('GraphData','U') IS NOT NULL DROP TABLE GraphData
GO
CREATE TABLE GraphData (
Seq INT,
Data INT
)
INSERT INTO GraphData(Seq, Data) SELECT 1, 2
INSERT INTO GraphData(Seq, Data) SELECT 2, 3
INSERT INTO GraphData(Seq, Data) SELECT 3, 4
INSERT INTO GraphData(Seq, Data) SELECT 4, 4
INSERT INTO GraphData(Seq, Data) SELECT 5, 5
INSERT INTO GraphData(Seq, Data) SELECT 6, 4
INSERT INTO GraphData(Seq, Data) SELECT 7, 3
INSERT INTO GraphData(Seq, Data) SELECT 8, 4
INSERT INTO GraphData(Seq, Data) SELECT 9, 4
INSERT INTO GraphData(Seq, Data) SELECT 10, 4
INSERT INTO GraphData(Seq, Data) SELECT 11, 3
INSERT INTO GraphData(Seq, Data) SELECT 12, 2
INSERT INTO GraphData(Seq, Data) SELECT 13, 2
INSERT INTO GraphData(Seq, Data) SELECT 14, 3
INSERT INTO GraphData(Seq, Data) SELECT 15, 3
INSERT INTO GraphData(Seq, Data) SELECT 16, 4
INSERT INTO GraphData(Seq, Data) SELECT 17, 4
INSERT INTO GraphData(Seq, Data) SELECT 18, 5

SELECT * FROM GraphData


select graph
from
(select driver.id,
driver.prefix+
replace(  (select
case when driver.id = dr.Data and dr.Data - dl.Data = -1 then '\'
when driver.id = dr.Data and dr.Data = dl.Data then '_'
when driver.id = dl.Data and dr.Data - dl.Data = 1 then '/'
when driver.id = 0 then '_'
when driver.id = -1 then cast((dl.Seq)%10 as char(1))
else '.' end as 'text()'
from graphdata dl
left outer join  graphData dr
on dl.Seq = dr.Seq - 1
order by dl.Seq
for xml path('')),'.',' ') AS [graph]
from
(select Seq as id, cast(seq as char(1))+'|' AS prefix
from GraphData
where seq <= 5) as driver
union all
select -1 as id, left(' '+ replicate(cast('0 1 2 3 4 5 6 7 8 9' as nvarchar(max)),(max(Seq)/10)+1),max(Seq)+2) as graph
from GraphData) as v
order by id desc
