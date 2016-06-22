create  TABLE tblMovieReleaseDates( Movie1 DATETIME, Movie2 DATETIME, Movie3 DATETIME, Movie4 DATETIME, Movie5 DATETIME ) 

INSERT INTO tblMovieReleaseDates 
SELECT '01/20/2010','02/15/2010','02/02/2010','03/31/2010','04/16/2010'
 UNION ALL
  SELECT '01/22/2010','02/16/2010','02/04/2010','04/05/2010','04/18/2010' 

 create  TABLE tblMovieReleasedIn( City VARCHAR(20), MovieNames VARCHAR(20), ReleaseDate Datetime ) 

 INSERT INTO tblMovieReleasedIn 
  SELECT 'Bangalore','Movie1','01/22/2010' UNION ALL
  SELECT 'Bangalore','Movie2','02/15/2010' UNION ALL 
  SELECT 'Bangalore','Movie3','02/04/2010' UNION ALL 
  SELECT 'Bangalore','Movie4','04/05/2010' UNION ALL 
  SELECT 'Bangalore','Movie5','04/16/2010' 

  SELECT * FROM  tblMovieReleasedIn

  
select City,
case when Sun=0 then 'Na' else MovieNames+'('+ RL+')' end Sun, 
case when Mon=0 then 'Na' else MovieNames+'('+ RL+')' end Mon,
case when Tue=0 then 'Na' else MovieNames+'('+ RL+')' end Tue,
case when Wed=0 then 'Na' else MovieNames+'('+ RL+')' end Wed,
case when Thu=0 then 'Na' else MovieNames+'('+ RL+')' end Thu,
case when Fri=0 then 'Na' else MovieNames+'('+ RL+')' end Fri,
case when Sat=0 then 'Na' else MovieNames+'('+ RL+')' end Sat

from
(select City, MovieNames, ReleaseDate, substring(datename(dw,ReleaseDate),1,3) As DayName,
CAST( ReleaseDate AS varchar(12))as RL
from tblMovieReleasedIn) As a


pivot
( count (ReleaseDate)
for DayName in ([Sun],[Mon],[Tue],[Wed],[Thu],[Fri],[Sat]))
As b
order by City
