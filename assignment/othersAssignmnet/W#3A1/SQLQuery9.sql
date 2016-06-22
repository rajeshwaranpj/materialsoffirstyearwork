CREATE TABLE GraphData ( Seq INT, Data INT )
 INSERT INTO GraphData(Seq, Data) 
 SELECT 1, 2
  INSERT INTO GraphData(Seq, Data) 
  SELECT 2, 3 
  INSERT INTO GraphData(Seq, Data)
   SELECT 3, 4 
   INSERT INTO GraphData(Seq, Data) 
   SELECT 4, 4
    INSERT INTO GraphData(Seq, Data) 
	SELECT 5, 5
	 INSERT INTO GraphData(Seq, Data)
	  SELECT 6, 4 
	  INSERT INTO GraphData(Seq, Data) 
	  SELECT 7, 3 
	  INSERT INTO GraphData(Seq, Data) 
	  SELECT 8, 4

	   INSERT INTO GraphData(Seq, Data)
	    SELECT 9, 4
		 INSERT INTO GraphData(Seq, Data) 
		 SELECT 10, 4 
		 INSERT INTO GraphData(Seq, Data) 
		 SELECT 11, 3 
		 INSERT INTO GraphData(Seq, Data) 
		 SELECT 12, 2
		  INSERT INTO GraphData(Seq, Data) 
		  SELECT 13, 2 
		  INSERT INTO GraphData(Seq, Data)
		   SELECT 14, 3 
		   INSERT INTO GraphData(Seq, Data)
		    SELECT 15, 3
			 INSERT INTO GraphData(Seq, Data) 
			 SELECT 16, 4 
			 INSERT INTO GraphData(Seq, Data)
			  SELECT 17, 4 
			  INSERT INTO GraphData(Seq, Data)
			   SELECT 18, 5  
SELECT * FROM GraphData 

SELECT geometry::STGeomFromText(
'LINESTRING(1 2,2 3,3 4, 4 4, 5 5,6 4,7 3,8 4,9 4,10 4,11 3,12 2,13 2,14 3,15 3,16 4,17 4,18 5)', 0 ); 
