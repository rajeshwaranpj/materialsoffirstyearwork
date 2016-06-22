create table tblMovieReleaseDates (
Movie1 DATETIME,
Movie2 DATETIME,
Movie3 DATETIME,
Movie4 DATETIME,
Movie5 DATETIME
)


INSERT INTO tblMovieReleaseDates
SELECT '01/20/2010','02/15/2010','02/02/2010','03/31/2010','04/16/2010'
UNION ALL
SELECT '01/22/2010','02/16/2010','02/04/2010','04/05/2010','04/18/2010'

create TABLE tblMovieReleasedIn (
City VARCHAR(20),
MovieNames VARCHAR(20),
ReleaseDate Datetime
)

INSERT INTO tblMovieReleasedIn
SELECT 'Bangalore','Movie1','01/22/2010' UNION ALL
SELECT 'Bangalore','Movie2','02/15/2010' UNION ALL
SELECT 'Bangalore','Movie3','02/04/2010' UNION ALL
SELECT 'Bangalore','Movie4','04/05/2010' UNION ALL
SELECT 'Bangalore','Movie5','04/16/2010'


SELECT * FROM tblMovieReleaseDates
select * from tblMovieReleasedIn

--select City, 
--Case When Sun = 0 Then 'NA' ELSE MovieNames + ' (' + substring(ReleaseDate,6,5) + ')' FROM tblMovieReleasedIn
--END SUN

select city,MovieNames,ReleaseDate,substring(datename(dw,ReleaseDate),1,3) as day from tblMovieReleasedIn
--select datename(weekday, '2015/09/15')     




select City, 
Case When Sun = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')'
END Sun,
Case When Mon = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')'
END Mon,
Case When Tue = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')' 
END Tue,
Case When Wed = 0 Then 'NA' ELSE MovieNames + ' (' + rd+ ')' 
END Wed,
Case When Thu = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')'
END Thu,
Case When Fri = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')'
END Fri,
Case When Sat = 0 Then 'NA' ELSE MovieNames + ' (' + rd + ')'
END Sat
from
(select City, MovieNames, ReleaseDate, substring(datename(weekday,ReleaseDate),1,3) As DayName,
convert(varchar(25),ReleaseDate,111) as rd
from tblMovieReleasedIn) As a
pivot
( count (ReleaseDate)
for DayName in ([Sun],[Mon],[Tue],[Wed],[Thu],[Fri],[Sat]))
As b
order by City
