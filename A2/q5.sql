<!DOCTYPE html>
<html>
<body>
  <pre>Set search_path To imdb;

--Create the relation with actors and there movies' years
Create View ActYear as
Select person_id,year
From roles natural join movies;

--3 Consectuive years
Create View ThreeYears as
Select Distinct T1.person_id as person_id,max(T1.year) as year1,max(T2.year) as year2,max(T3.year) as year3
From ActYear T1,ActYear T2, ActYear T3
Where T1.person_id=T2.person_id and T1.person_id=T3.person_id and
      T1.year+1=T2.year and T2.year+1=T3.year
Group by T1.person_id;

--Report all the required attributes
Select T.person_id as person_id,name,year1,min(T1.title) as movie1,year2,min(T2.title) as movie2,
	year3,min(T3.title) as movie3
From (ThreeYears Natural join people) T,(movies natural join roles) T1,(movies natural join roles) T2,(movies natural join roles) T3
Where year1=T1.year and year2=T2.year 
      and year3=T3.year and T.person_id=T1.person_id and T.person_id=T2.person_id and T.person_id =T3.person_id
Group by T.person_id,name,year1,year2,year3
Order by T.person_id;
</pre>
</body>
</html>
