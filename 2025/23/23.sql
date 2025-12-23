-- Question 1 of 1

-- The Gingerbread House Competition wants to feature the builders who used at least 4 distinct candy types in their designs. How would you identify these builders?

-- gingerbread_designs (builder_id: INT, builder_name: VARCHAR, candy_type: VARCHAR)

select
    builder_id,
    builder_name
from gingerbread_designs
group by
    builder_id,
    builder_name
having
    count(distinct candy_type) >= 4
