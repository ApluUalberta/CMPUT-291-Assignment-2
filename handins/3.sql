.print Question 3 -Aplu

select p.author, p.csession, count(p.id)
from Papers p
Group By p.author, p.csession
Having p.decision = 'A'
