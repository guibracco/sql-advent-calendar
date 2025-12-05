-- Question 1 of 1
-- 
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
-- 
-- elves (elf_id: INT, elf_name: VARCHAR)
-- vacations (elf_id: INT, start_date: DATE, return_date: DATE)

select
    e.elf_name,
    v.start_date,
    case
      when v.start_date is null then null
      when v.return_date is not null then cast (v.return_date as varchar)
      when v.return_date is null then 'Still resting'
    end as return_date
from elves as e
left join vacations as v
on e.elf_id = v.elf_id
order by e.elf_id
