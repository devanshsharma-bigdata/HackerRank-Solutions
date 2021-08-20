select proj1.start_date, 
(select min(proj2.end_date) from projects proj2 where proj2.end_date not in (select start_date from projects) and proj2.end_date > proj1.start_date) as req_date
from projects proj1 where proj1.start_date not in (select end_date from projects)
order by req_date-proj1.start_date asc, proj1.start_date asc;
