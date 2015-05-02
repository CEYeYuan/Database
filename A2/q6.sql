<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path To imdb;

--Select all the movies released before 1990
Create View MovieSequel as
Select movie_id +(select max(movie_id) from movies) as movie_id,title||': The Sequel'
       as title,2020 as year,rating
From movies
Where year&lt;1990
Order by movie_id;

--insert the Sequel into database
Insert into movies
(Select * From MovieSequel);
</pre>
</body>
</html>
