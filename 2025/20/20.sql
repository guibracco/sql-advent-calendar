-- Question 1 of 1

-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?

-- cocoa_logs (log_id: INT, break_id: INT, cocoa_id: INT)
-- break_schedule (break_id: INT, location_id: INT)
-- cocoa_types (cocoa_id: INT, cocoa_name: VARCHAR)
-- locations (location_id: INT, location_name: VARCHAR)

select
    bs.break_id,
    ct.cocoa_name,
    l.location_name
from cocoa_logs cl
left join break_schedule bs
    on cl.break_id = bs.break_id
left join cocoa_types ct
    on cl.cocoa_id = ct.cocoa_id
left join locations l
    on bs.location_id = l.location_id
order by bs.break_id asc
