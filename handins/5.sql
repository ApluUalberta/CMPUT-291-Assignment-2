.print Question 5 -Aplu
select distinct p.title 
from papers p, reviews r
where (p.id = r.paper)
and (overall > (r.originality + r.soundness + r.importance)/3)
