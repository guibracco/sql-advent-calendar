-- Question 1 of 1

-- The penguins are signing up for a community sleigh ride, but the organizers need a list of everyone who did NOT choose the "Evening Ride." How would you return all penguins whose selected time is not the evening slot?

-- sleigh_ride_signups (signup_id: INT, penguin_name: VARCHAR, ride_time: VARCHAR)

select
    penguin_name
from sleigh_ride_signups
where ride_time <> 'Evening'
order by penguin_name
