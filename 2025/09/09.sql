-- Question 1 of 1

-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").

-- tinsel_colors (tinsel_id: INT, color_name: VARCHAR)
-- light_colors (light_id: INT, color_name: VARCHAR)

select
    t.color_name as tinsel_color,
    l.color_name as light_color,
    concat(t.color_name, '-', l.color_name) as combination
from tinsel_colors t
cross join light_colors l
order by t.color_name, l.color_name
