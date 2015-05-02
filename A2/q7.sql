<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path To imdb;
--select the movie_id ralated with M. Night Shyamanlan
Create table MovID as
Select movie_id
from ((Select * from cinematographers)  union (Select * from composers) union
     (Select * from directors) union (select movie_id,person_id from roles) union
     (Select * from writers)) T,people
where name='Pitt, Brad' and T.person_id=people.person_id; 

--report the person_id that work with M. Night Shyamanlan
Create table PeoID as
Select person_id
from ((Select * from cinematographers)  union (Select * from composers) union
     (Select * from directors) union (select movie_id,person_id from roles) union
     (Select * from writers)) Tab
where movie_id in (Select * from MovID);


--delete these movies/reference these movies,people/reference these people
Delete
From cinematographers
where movie_id in (Select * from MovID) or person_id in (Select * from PeoID);

Delete
From composers
where movie_id in (Select * from MovID) or person_id in (Select * from PeoID);

Delete
From directors
where movie_id in (Select * from MovID) or person_id in (Select * from PeoID);

Delete
From writers
where movie_id in (Select * from MovID) or person_id in (Select * from PeoID);

Delete
From roles
where movie_id in (Select * from MovID) or person_id in (Select * from PeoID);

Delete
From movie_genres
where movie_id in (Select * from MovID);

Delete 
From movie_keywords
where movie_id in (Select * from MovID); 

Delete
From movies
where movie_id in (Select * from MovID);

Delete
From people
where person_id in (Select * from PeoID);

</pre>
</body>
</html>
