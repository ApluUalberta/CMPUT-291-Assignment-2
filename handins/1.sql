.print Question 1 - Aplu

select count(p.id)
from papers p
where p.decision = 'A'
Group by area
