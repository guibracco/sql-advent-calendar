-- Question 1 of 1

-- Santa wants to analyze which toys that were produced in his workshop have already been delivered to children. You are given two tables on toy production and toy delivery — can you return the toy ID and toy name of the toys that have been delivered?

-- toy_production (toy_id: INTEGER, toy_name: VARCHAR, production_date: DATE)
-- toy_delivery (toy_id: INTEGER, child_name: VARCHAR, delivery_date: DATE)

select
  p.toy_id,
  toy_name
from toy_production as p
inner join toy_delivery as d
on p.toy_id = d.toy_id
