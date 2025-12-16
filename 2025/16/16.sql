-- Question 1 of 1

-- It's a snow day, and Buddy is deciding which tasks he can do from under a blanket. Can you find all tasks that are either marked as 'Work From Home' or 'Low Priority' so he can stay cozy and productive?

-- daily_tasks (task_id: INTEGER, task_name: VARCHAR, task_type: VARCHAR, priority: VARCHAR)

select
    task_id,
    task_name
from daily_tasks
where task_type = 'Work From Home' or priority = 'Low'
