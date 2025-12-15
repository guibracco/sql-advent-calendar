-- Question 1 of 1

-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?

-- grinch_mischief_log (log_date: DATE, mischief_score: INTEGER)

select
    log_date,
    mischief_score,
    mischief_score - LAG(mischief_score) over (
        order by log_date
    ) as mischief_change
from grinch_mischief_log
