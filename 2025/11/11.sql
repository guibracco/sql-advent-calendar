-- Question 1 of 1

-- At the winter market, Cindy Lou is browsing the clothing inventory and wants to find all items with "sweater" in their name. But the challenge is the color and item columns have inconsistent capitalization. Can you write a query to return only the sweater names and their cleaned-up colors.

-- winter_clothing (item_id: INT, item_name: VARCHAR, color: VARCHAR)

select
    lower(item_name) as item_name,
    lower(color) as color
from winter_clothing
where lower(item_name) like '%sweater%'
