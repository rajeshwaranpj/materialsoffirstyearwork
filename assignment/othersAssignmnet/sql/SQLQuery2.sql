create table tmpData (
ID INT,
NAME VARCHAR(MAX)
)

INSERT INTO tmpData (ID,[NAME]) SELECT 1, 'Deepak Kumar Goyal'
INSERT INTO tmpData (ID,[NAME]) SELECT 2, 'Niladri Biswas'
INSERT INTO tmpData (ID,[NAME]) SELECT 2, 'Pratik Shaw'
INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Sumi Girijan'
INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Suresh Beldar'
INSERT INTO tmpData (ID,[NAME]) SELECT 3, 'Jeeva Baby'

select * from tmpdata


;with table1
as
(
      select  tmpData.ID,tmpData.name
      from tmpdata
      where tmpData.name is not null and isnull(tmpData.name,'') <> ''                   
),
table2
AS
(
      select id,count(distinct name)as total from table1
      group by id
),
res
AS
(    
      select t1.ID,t1.NAME, t2.total, row_number() over(partition by t1.id order by t1.id) as row_num
      from table1 t1
            inner join table2 t2
                  on t1.id = t2.id
),
res2
as
(
      select id, name, row_num
      from res
      where row_num = 1     
      union all     
      select r2.id,
               case when r.total = 2 then r2.name  + ' AND '+r.name    
                    when r.total > 2 THEN r2.name + ' OR '+r.name
               end as name,r.row_num                                      
      from res2 r2
            inner join res r
                  on r2.ID = r.ID and (r2.row_num + 1) =  r.row_num
)
select r.ID,r.NAME from res2 r
where r.row_num =
(
      select max(r2.row_num) from res2 r2 where r2.ID = r.ID
)
order by id