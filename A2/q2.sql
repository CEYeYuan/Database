<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path To imdb;
--report movie and it's number of keyword
Create View  MovieNumKey as
Select movie_id,count(keyword_id) as keywords
From movie_keywords
Group by movie_id;

--Answer for non-zero keyword movies
Create view NonZeroKey as
Select keywords,avg(rating) as avgrating
From MovieNumKey natural join movies
Group By keywords
Order by keywords; 


--Average rating for movies with no keywords
Create view zero as 
Select 0 as keywords,avg(rating) as avgrating
From ((select movie_id from movies) Except (select movie_id from movie_keywords)) R1  natural join movies;

--Answer
Create View Answer11 as 
Select * 
from (select * from NonZeroKey) T1 union (select * from zero) ; 
   
--eliminate null item
Select *
from Answer11 a natural join Answer11
order by keywords;
	
</pre>
</body>
</html>
