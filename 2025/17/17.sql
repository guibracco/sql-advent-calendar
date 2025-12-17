-- Question 1 of 1

-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?

-- evening_tasks (task_id: INTEGER, task_name: VARCHAR, noise_level: INTEGER)

select
    *,
    case
        when noise_level < 50 then 'Calm'
        when noise_level >= 50 then 'Chaotic'
    end as task_category
from evening_tasks
