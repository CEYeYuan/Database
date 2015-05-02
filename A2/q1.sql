<!DOCTYPE html>
<html>
<body>
  <pre>SET search_path TO imdb;
--Movies 'Pitt,Brad' as actor
CREATE VIEW BradMovies AS
SELECT movie_id
FROM roles,people
WHERE roles.person_id=people.person_id and name='Pitt, Brad';

--work with Brad as a composer
CREATE VIEW Composer as
SELECT DISTINCT movie_id,person_id
FROM composers NATURAL JOIN BradMovies;

--work with Brad as a writer
CREATE VIEW Writer as
SELECT DISTINCT movie_id,person_id
FROM writers NATURAL JOIN BradMovies;

--work with Brad as a writer or composer
CREATE VIEW WorkWithBrad as
SELECT person_id,count(*) as bradtimes
FROM ((SELECT * FROM Writer) UNION (SELECT * FROM Composer)) T
GROUP BY T.person_id;

--get their names
SELECT name,bradtimes
FROM WorkWithBrad,people
WHERE WorkWithBrad.person_id=people.person_id
ORDER BY name;

</pre>
</body>
</html>
