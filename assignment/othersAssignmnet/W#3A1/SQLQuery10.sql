create  TABLE cal1( Mth INT , Yr INT )
    SELECT * FROM cal1 

insert into cal1
 SELECT 8, 2009 UNION ALL 
  SELECT 2, 1900 UNION ALL
   SELECT 10, 1959  

;WITH Nums (Num) AS (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7)
SELECT
	CASE G.Num
	WHEN 1 THEN '+-----------------------------+'
	WHEN 2 THEN Stuff('|                                    |', 14 - (Len(DateName(Month,  DateAdd(Month, M.Mth - 1, 0))) + 1) / 2,  Len(DateName(Month, DateAdd(Month, M.Mth - 1, 0))) + 5, Upper(DateName(Month,  DateAdd(Month, M.Mth - 1, 0))) + ' ' + Convert(varchar(4), M.Yr))
	WHEN 3 THEN '|=============================|'
	WHEN 4 THEN '| ' + Left(DateName(WeekDay, -1), 3) + ' ' + Left(DateName(WeekDay, 0), 3) + ' ' + Left(DateName(WeekDay, 1), 3) + ' ' + Left(DateName(WeekDay, 2), 3) + ' ' + Left(DateName(WeekDay, 3), 3) + ' ' + Left(DateName(WeekDay, 4), 3) + ' ' + Left(DateName(WeekDay, 5), 3) + ' |'
	WHEN 5 THEN '|-----------------------------|'
	WHEN 6 THEN '|  ' + Substring(
		'                                       1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28 '
		+ CASE DatePart(Day, DateAdd(Day, -1, DateAdd(Month, M.Mth, DateAdd(Year, M.Yr - 1900, 0)) ))
		WHEN 28 THEN '                        '
		WHEN 29 THEN ' 29                         '
		WHEN 30 THEN ' 29  30                         '
		WHEN 31 THEN ' 29  30  31                         '
		END,
		W.Num * 28 - 4 * (DateDiff(Day, -1, DateAdd(Month, M.Mth - 1, DateAdd(Year, M.Yr - 1900, 0))) % 7), 28) + '|'
	WHEN 7 THEN '+-----------------------------+'
	END
FROM
	cal1 M
	INNER JOIN Nums W ON W.Num <= (DatePart(Day, DateAdd(Day, -1,  DateAdd(Month, M.Mth, DateAdd(Year, M.Yr - 1900, 0)))) + (DateDiff(Day, -1,  DateAdd(Month, M.Mth - 1, DateAdd(Year, M.Yr - 1900, 0))) % 7) + 6) / 7
	INNER JOIN Nums G ON G.Num = 6 OR W.Num = 1
ORDER BY
	M.Yr,
	M.Mth,
	G.Num,
	W.Num


