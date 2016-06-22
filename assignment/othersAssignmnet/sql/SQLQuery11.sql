create TABLE cal (
Mth INT,
Yr INT
)

insert into cal
SELECT 8, 2009 UNION ALL
SELECT 2, 1900 UNION ALL
SELECT 10, 1959


SELECT * FROM cal


DECLARE @Month AS INT = 8
DECLARE @Year AS INT = 2009
DECLARE @StartDate AS DATETIME = CONVERT(VARCHAR,@Year) + RIGHT('0' + CONVERT(VARCHAR,@Month),2) + '01'
--DECLARE @EndDate AS DATETIME = DATEADD(DAY,-1,DATEADD(MONTH,1,@StartDate));

SELECT
SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 1 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Sunday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 2 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Monday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 3 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Tuesday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 4 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Wednesday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 5 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Thursday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 6
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Friday
,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@StartDate)) = 7 
THEN DATEPART(DAY, DATEADD(DD,NUMBER,@StartDate)) END) AS Saturday
FROM master.dbo.spt_values v
WHERE DATEADD(DD,number,@StartDate) BETWEEN @StartDate 
AND DATEADD(DAY,-1,DATEADD(MONTH,1,@StartDate))
AND v.type = 'P'
GROUP BY DATEPART(WEEK, DATEADD(DD,number,@StartDate)) 


--;with cte_table 
--as
--(
--	select cal.Mth,cal.Yr from cal
--	union all
--	select CONVERT(VARCHAR,yr) + RIGHT('0' + CONVERT(VARCHAR,mth),2) + '01' as startdate from cte_table 
	
	
--)
--select startdate from cte_table
--cte_table2
--as
--(
--	select mth,yr from cte_table
--)



;with clndr(yr, mth, n, dw1, mname) as
(
Select yr, mth,
datediff(day, dateadd(month, 12 * (yr - 1900) + mth - 1, 0), dateadd(month, 12 * (yr - 1900) + mth, 0)),
datepart(weekday, dateadd(month, 12 * (yr - 1900) + mth - 1, 0) + @@datefirst),
upper(datename(month, dateadd(month, 12 * (yr - 1900) + mth - 1, 0))) + ' ' + convert(varchar(4), yr)
from cal
),
tbl(yr, mth, d, dw, nw) as
(
Select cd.yr, cd.mth, t.number,
(t.number + cd.dw1 + 5) % 7 + 1,
(t.number + cd.dw1 + 5) / 7
from clndr cd
Inner Join master..spt_values t on cd.n - t.number >= 0
and t.type = 'P' and t.number between 1 and 31
),
clnd(yr, mth, d1, d2, d3, d4, d5, d6, d7) as
(
Select tbl.yr, tbl.mth,
max(Case when tbl.dw = 1 then tbl.d else 0 End),
max(Case when tbl.dw = 2 then tbl.d else 0 End),
max(Case when tbl.dw = 3 then tbl.d else 0 End),
max(Case when tbl.dw = 4 then tbl.d else 0 End),
max(Case when tbl.dw = 5 then tbl.d else 0 End),
max(Case when tbl.dw = 6 then tbl.d else 0 End),
max(Case when tbl.dw = 7 then tbl.d else 0 End)
from tbl
group by tbl.yr, tbl.mth, tbl.nw
),
clnd2(yr, mth, sort, d1, calendar) as
(
Select yr, mth, 2,  0, ' ' + space((29 - len(mname)) / 2) + mname + space((30 - len(mname)) / 2) + ' '
from clndr
UNION
Select yr, mth, 4,  0, ' ' + left(datename(weekday,  6), 3) + ' ' +
left(datename(weekday,  0), 3) + ' ' +
left(datename(weekday,  1), 3) + ' ' +
left(datename(weekday,  2), 3) + ' ' +
left(datename(weekday,  3), 3) + ' ' +
left(datename(weekday,  4), 3) + ' ' +
left(datename(weekday,  5), 3) + ' '
from clndr
UNION
Select yr, mth, 6, d1,
' ' + replace(right('   ' + convert(varchar(2), d1), 4) +
right('   ' + convert(varchar(2), d2), 4) +
right('   ' + convert(varchar(2), d3), 4) +
right('   ' + convert(varchar(2), d4), 4) +
right('   ' + convert(varchar(2), d5), 4) +
right('   ' + convert(varchar(2), d6), 4) +
right('   ' + convert(varchar(2), d7), 4), ' 0', '  ') + ' '
from clnd
)
Select calendar from clnd2 order by yr, mth, sort, d1
