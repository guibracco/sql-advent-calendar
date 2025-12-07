-- Question 1 of 1

-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?

-- resort_monthly_snowfall (resort_id: INT, resort_name: VARCHAR, snow_month: INT, snowfall_inches: DECIMAL)

with annual as (
    select
        resort_id,
        resort_name,
        sum(snowfall_inches) as annual_snowfall_inches
    from resort_monthly_snowfall
    group by resort_id, resort_name
)
select
    resort_id,
    resort_name,
    annual_snowfall_inches,
    ntile(4) over (order by annual_snowfall_inches desc) as quartile  -- 1=highest, 4=lowest
from annual
order by annual_snowfall_inches desc
