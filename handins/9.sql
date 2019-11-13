.print Question 9 -Aplu
select p1.area
from reviews r, papers p1
where p1.id = r.paper
group by p1.area
having avg(r.originality) in (select max(computed_averages)
				from (select avg(r.originality) as computed_averages
				     from reviews r, papers p
				     where p.id = r.paper
				     group by p.area))
