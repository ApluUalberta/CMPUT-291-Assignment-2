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
		  where na.name = enew.area)
