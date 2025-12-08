-- Question 1 of 1

-- Mrs. Claus is organizing the holiday storage room and wants a single list of all decorations — both Christmas trees and light sets. Write a query that combines both tables and includes each item's name and category.

-- storage_lights (item_name: VARCHAR, category: VARCHAR)
-- storage_trees (item_name: VARCHAR, category: VARCHAR)

select *
from storage_lights

union all

select *
from storage_trees
