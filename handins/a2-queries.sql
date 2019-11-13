.echo on
--Question 1
.print Question 1 - Aplu
select count(p.id)
from papers p
where p.decision = 'A'
Group by area;


--Question 2
.print Question 2 -Aplu
select p.author, count(distinct p.csession)
from Papers p
where p.decision = 'A'
GROUP BY p.author;


--Question 3
.print Question 3 -Aplu
select p.author, p.csession, count(p.id)
from Papers p
Group By p.author, p.csession
Having p.decision = 'A';


--Question 4
.print Question 4 -Aplu

select p.author, s.name, 0
from Papers p, sessions s
Group By p.author, s.name

union 

select p.author, p.csession, count(p.id)
from Papers p
Group By p.author, p.csession
Having p.decision = 'A'

except 

select p.author, p.csession, 0
from Papers p
Group By p.author, p.csession
Having p.decision = 'A';


--Question 5
.print Question 5 -Aplu
select distinct p.title 
from papers p, reviews r
where (p.id = r.paper)
and (overall > (r.originality + r.soundness + r.importance)/3);


--Question 6
.print Question 6 -Aplu

select p.area, r.reviewer, u.name
from papers p, reviews r, users u
where p.area in (select  p.area
		  from   reviews r, papers p
   		 where  p.id = r.paper
		group by p.area
		having avg(r.overall) > 4)
and p.id = r.paper
and r.reviewer = u.email;


--Question 7
.print Question 7 -Aplu

select u.name, p.title
from users u, papers p, reviews r
where  (p.id = r.paper)
and (u.email = r.reviewer)
group by u.name, p.title

union 

select u.name, NULL
from users u
group by u.name, NULL

except

select u.name, null
from users u, papers p, reviews r
where  (p.id = r.paper)
and (u.email = r.reviewer)
group by u.name, p.title;


--Question 8
.print Question 8 -Aplu
select a.name
from areas a

except
select distinct area as name
from(select *
      from expertise e2

      except

      select e.area, e. reviewer
	from expertise e
	where	2 = (select count(r.paper)
		       from reviews r
		      where (e.reviewer = r.reviewer)))

except

select na.name
from areas na
where not exists (select enew.area
		   from expertise enew
		  where na.name = enew.area);


--Question 9
.print Question 9 -Aplu
select p1.area
from reviews r, papers p1
where p1.id = r.paper
group by p1.area
having avg(r.originality) in (select max(computed_averages)
				from (select avg(r.originality) as computed_averages
				     from reviews r, papers p
				     where p.id = r.paper
				     group by p.area));
