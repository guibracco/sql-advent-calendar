-- Question 1 of 1

-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.

-- npn_users (user_id: INT, user_name: VARCHAR)
-- npn_messages (message_id: INT, sender_id: INT, sent_at: TIMESTAMP)

with daily_counts as (
    select
        date(m.sent_at) as message_day,
        u.user_name,
        count(*) as messages_sent
    from npn_messages m
    join npn_users u
        on u.user_id = m.sender_id
    group by date(m.sent_at), u.user_name
),
ranked as (
    select
        message_day,
        user_name,
        messages_sent,
        rank() over (
            partition by message_day
            order by messages_sent desc
        ) as r
    from daily_counts
)
select
    message_day,
    user_name,
    messages_sent
from ranked
where r = 1
order by message_day, user_name
