<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path to imdb;

--movie_id and all the positons
Create View MoviePositions as
Select movie_id,person_id
from (select * from cinematographers) T2 union all(select * from composers) union all
     (select * from  directors) union all (Select Distinct movie_id,person_id from roles)
     union all(select * from writers);

--report the number of positons
Create View MovNumPos as
Select movie_id,count(*) as positions
From MoviePositions
Group by movie_id;

--report the number of distinct people
Create View MovNumPeo as
Select movie_id,count(*) as people
From (Select Distinct * From MoviePositions) T2
Group by movie_id;

--report the all the required attribute with non-zero people/postions work for it
Select movie_id,positions,people
From MovNumPos natural join MovNumPeo
Order by positions DESC,people DESC,movie_id ASC;


</pre>
</body>
</html>
