-- Question 1 of 1

-- The Snow Queen hosts nightly fireside chats and records how many stories she tells each evening. Can you calculate the running total of stories she has shared over time, in the order they were told?

-- story_log (log_date: DATE, stories_shared: INT)

-- Concise Query
select 
    log_date,
    stories_shared,
    sum(stories_shared) over (order by log_date) as running_total_stories
    -- Default window frame is used here
from 
    story_log
order by 
    log_date

-- Explicit Window Frame Query
select
    log_date,
    sum(stories_shared) over (
        order by log_date
        rows between unbounded preceding and current row -- Define window frame explicitly
    ) as running_total_stories
from story_log
order by log_date

-- Both queries produce the same result. The first query uses the default window frame, while the second query explicitly defines the window frame to include all rows from the start up to the current row.
