select count(policy_holder_id) as policy_holder_count
from (
SELECT policy_holder_id, 
count(case_id) as no_of_cases
FROM callers
group by policy_holder_id
having count(case_id)>=3
)as P
