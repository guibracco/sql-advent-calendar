-- Question 1 of 1

-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.

-- grinch_prank_ideas (prank_id: INTEGER, target_name: VARCHAR, prank_description: VARCHAR, evilness_score: INTEGER, created_at: TIMESTAMP)

with best_per_target as (
    select
      *,
      row_number() over (
        partition by target_name
        order by evilness_score desc, created_at desc
      ) as rn
    from grinch_prank_ideas
)

select
    prank_id,
    target_name,
    prank_description,
    evilness_score,
    created_at
from best_per_target
where rn = 1
order by target_name;
