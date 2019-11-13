.print Question 2 -Aplu
select p.author, count(distinct p.csession)
from Papers p
where p.decision = 'A'
GROUP BY p.author
