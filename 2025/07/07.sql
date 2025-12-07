-- Question 1 of 1

-- Frosty wants to know how many unique snowflake types were recorded on the December 24th, 2025 storm. Can you help him?

-- snowfall_log (flake_id: INT, flake_type: VARCHAR, fall_time: TIMESTAMP)

select
    count(distinct flake_type)
from snowfall_log
where date(fall_time) = '2025-12-24'
