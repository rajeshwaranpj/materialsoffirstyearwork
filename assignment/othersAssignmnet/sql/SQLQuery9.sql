IF OBJECT_ID('EXPR') IS NOT NULL BEGIN
DROP TABLE EXPR
END
GO
CREATE TABLE EXPR(
id INT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
expr VARCHAR(8000),
x0 FLOAT,
dx FLOAT,
points INT
)
GO
INSERT INTO EXPR
SELECT '1+2*(4+X)',0,0.1,4 UNION ALL
SELECT 'X^2/2', 0,0.1,4 UNION ALL
SELECT 'X^X', 0,10,4

select * from EXPR




;WITH     C (id, expr, v, q, s, x, r, t, w, l, i, n)
AS       (SELECT c.id,
c.expr,
c.x0 + (c.dx *c.points),
CAST ('' AS VARCHAR (8000)),
CAST ('' AS VARCHAR (8000)),
CAST ('' AS VARCHAR (8000)),
CAST ('' AS VARCHAR (8000)),
'(',
REPLACE(c.expr, ' ', '') + ')',
0,
0,
CAST (0 AS FLOAT (53))
FROM   expr AS t WITH (NOLOCK)
INNER JOIN
EXPR AS c WITH (NOLOCK)
ON t.points < c.points
UNION ALL
SELECT id,
expr,
v,
q + CASE t WHEN '^' THEN LEFT(s, PATINDEX('%[(*/+--]%', s) - 1) WHEN '*' THEN LEFT(s, PATINDEX('%[(+--]%', s) - 1) WHEN '/' THEN LEFT(s, PATINDEX('%[(+--]%', s) - 1) WHEN '+' THEN LEFT(s, CHARINDEX(CHAR(40), s) - 1) WHEN '-' THEN LEFT(s, CHARINDEX(CHAR(40), s) - 1) WHEN ')' THEN LEFT(s, CHARINDEX(CHAR(40), s) - 1) WHEN '(' THEN '' WHEN '' THEN '' WHEN 'X' THEN CAST (V AS VARCHAR (8000)) + CHAR(32) ELSE t + ' ' END,
CASE ASCII(t) WHEN 94 THEN '^ ' + SUBSTRING(s, PATINDEX('%[(*/+--]%', s), l) WHEN 42 THEN '* ' + SUBSTRING(s, PATINDEX('%[(+--]%', s), l) WHEN 47 THEN '/ ' + SUBSTRING(s, PATINDEX('%[(+--]%', s), l) WHEN 43 THEN '+ ' + SUBSTRING(s, CHARINDEX(CHAR(40), s), l) WHEN 45 THEN '- ' + SUBSTRING(s, CHARINDEX(CHAR(40), s), l) WHEN 40 THEN '( ' + s WHEN 41 THEN SUBSTRING(s, CHARINDEX(CHAR(40), s) + 2, l) ELSE s END,
SUBSTRING(q, i + 1, NULLIF (CHARINDEX(CHAR(32), q, i + 1), 0) - i - 1),
CASE WHEN x IS NULL THEN r WHEN CHARINDEX(x, '*/+-^') = 0 THEN CONVERT(VARCHAR(8000), n, 2) + CHAR(32) + r ELSE RIGHT(r, 1 + LEN(r) - CHARINDEX(CHAR(32), r)) END,
LEFT(w, 1),
LTRIM(SUBSTRING(w, 2, LEN(w))),
LEN(s),
ISNULL(NULLIF (CHARINDEX(CHAR(32), q, i + 1), 0), DATALENGTH(q)),
n = CASE ISNULL(x, '') WHEN '' THEN n WHEN '^' THEN POWER(CAST (LEFT(r, CHARINDEX(CHAR(32), r)) AS FLOAT (53)), n) WHEN '*' THEN CAST (LEFT(r, CHARINDEX(CHAR(32), r)) AS FLOAT (53)) * n WHEN '/' THEN CAST (LEFT(r, CHARINDEX(CHAR(32), r)) AS FLOAT (53)) / n WHEN '+' THEN CAST (LEFT(r, CHARINDEX(CHAR(32), r)) AS FLOAT (53)) + n WHEN '-' THEN CAST (LEFT(r, CHARINDEX(CHAR(32), r)) AS FLOAT (53)) - n ELSE cast(x as float(53)) END
FROM   C
WHERE  NOT (t = ''
AND x IS NULL))
SELECT   expr,
v AS x,
n AS value
FROM     C
WHERE    t = ''
AND x IS NULL
ORDER BY expr, v
OPTION (MAXRECURSION 0);