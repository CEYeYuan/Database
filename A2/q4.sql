<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path To imdb;

--Report all the super movies.
Create View SuperMovie as
Select movie_id,CAST(year AS char(3))||'0s' as decade,title,rating
From movies T 
Where T.rating&gt;= all(
Select T1.rating
from movies T1
where CAST(T.year AS char(3))=CAST(T1.year AS char(3)));

--report all the writers
Create View AllWriter as 
select Distinct person_id
from writers;

--report the writers with a non-super movie
Create View NonSuperWriter as
select person_id 
from  ( (Select  movie_id from movies) Except (Select  movie_id from SuperMovie) 
      ) R Natural join writers;

--report all the required attribute
Select name as writer,title as supermovie,rating,decade
From ((Select person_id from AllWriter) Except (Select * from NonSuperWriter)) A1 natural
     join people natural join writers natural join SuperMovie 
Order by name,decade,title;
</pre>
</body>
</html>
