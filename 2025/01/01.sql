-- Question 1 of 1

-- Every year, the city of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Can you write a query to return the name and rank of the top 7 reindeers in this race?

-- reindeer_run_results (number: INTEGER, name: VARCHAR, rank: INTEGER, color: VARCHAR)

select
    name,
    rank
from reindeer_run_results
where rank <= 7
order by rank
