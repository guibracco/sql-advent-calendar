-- Question 1 of 1

-- Kevin's trying to decorate the house without sending the electricity bill through the roof. Write a query to find the top 5 most energy-efficient decorations (i.e. lowest cost per hour to operate).

-- hall_decorations (decoration_id: INT, decoration_name: VARCHAR, energy_cost_per_hour: DECIMAL)

select
    decoration_name,
    energy_cost_per_hour
from hall_decorations
order by energy_cost_per_hour
limit 5