-- Question 1 of 1

-- Santa's audit team is reviewing this year's behavior scores to find the extremes — write a query to return the lowest and highest scores recorded on the Naughty or Nice list.

-- behavior_scores (record_id: INTEGER, child_name: VARCHAR, behavior_score: INTEGER)

with ranked as (
  select
    child_name,
    behavior_score,
    rank() over (order by behavior_score asc)  as r_min,
    rank() over (order by behavior_score desc) as r_max
  from behavior_scores
)
select child_name, behavior_score, 'Lowest' as extreme
from ranked
where r_min = 1
union all
select child_name, behavior_score, 'Highest' as extreme
from ranked
where r_max = 1
order by extreme, child_name
