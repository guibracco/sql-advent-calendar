-- Question 1 of 1

-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?

-- cookie_batches (batch_id: INT, oven_id: INT, baking_time_minutes: DECIMAL)

select
    oven_id,
    round(avg(baking_time_minutes), 1) as avg_baking_time
from cookie_batches
group by oven_id
