-- Question 1 of 1

-- The Productivity Club is tracking members' challenge start dates and wants to calculate each member's focus_end_date, exactly 14 days after their start date. Can you write a query to return the existing table with the focus_end_date column?

-- focus_challenges (member_id: INTEGER, member_name: VARCHAR, start_date: DATE)

select
    *,
    date(start_date + interval '14' day) focus_end_date
from focus_challenges
