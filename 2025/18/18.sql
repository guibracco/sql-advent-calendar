-- Question 1 of 1

-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?

-- daily_quiz_scores (subject: VARCHAR, quiz_date: DATE, score: INTEGER)

with ranked as (
    select
        subject,
        quiz_date,
        score,
        row_number() over (
            partition by subject
            order by quiz_date asc
        ) as rn_first,
        row_number() over (
            partition by subject
            order by quiz_date desc
        ) as rn_last
    from daily_quiz_scores
),
first_score as (
    select
        subject,
        quiz_date as first_date,
        score as first_score
    from ranked
    where rn_first = 1
),
last_score as (
    select
        subject,
        quiz_date as last_date,
        score as last_score
    from ranked
    where rn_last = 1
)
select
    f.subject,
    f.first_date,
    f.first_score,
    l.last_date,
    l.last_score,
    l.last_score - f.first_score as improvement
from first_score f
join last_score l
    on l.subject = f.subject
order by f.subject


-- Shorter SQL solution:
with ranked as (
    select
        subject,
        quiz_date,
        score,
        row_number() over (
            partition by subject
            order by quiz_date asc
        ) as rn_first,
        row_number() over (
            partition by subject
            order by quiz_date desc
        ) as rn_last
    from daily_quiz_scores
)
select
    subject,
    max(case when rn_first = 1 then quiz_date end) as first_date,
    max(case when rn_first = 1 then score end) as first_score,
    max(case when rn_last = 1 then quiz_date end) as last_date,
    max(case when rn_last = 1 then score end) as last_score,
    max(case when rn_last = 1 then score end)
        - max(case when rn_first = 1 then score end) as improvement
from ranked
group by subject
order by subject


-- BigQuery solution:
with first_score as (
    select
        subject,
        quiz_date as first_date,
        score as first_score
    from daily_quiz_scores
    qualify row_number() over (
        partition by subject
        order by quiz_date asc
    ) = 1
),
last_score as (
    select
        subject,
        quiz_date as last_date,
        score as last_score
    from daily_quiz_scores
    qualify row_number() over (
        partition by subject
        order by quiz_date desc
    ) = 1
)
select
    f.subject,
    f.first_date,
    f.first_score,
    l.last_date,
    l.last_score,
    l.last_score - f.first_score as improvement
from first_score f
join last_score l using (subject)
order by f.subject


-- Very BigQuery solution:
select
    subject,
    (array_agg(struct(quiz_date, score) order by quiz_date asc  limit 1))[offset(0)].quiz_date as first_date,
    (array_agg(struct(quiz_date, score) order by quiz_date asc  limit 1))[offset(0)].score     as first_score,
    (array_agg(struct(quiz_date, score) order by quiz_date desc limit 1))[offset(0)].quiz_date as last_date,
    (array_agg(struct(quiz_date, score) order by quiz_date desc limit 1))[offset(0)].score     as last_score,
    (array_agg(struct(quiz_date, score) order by quiz_date desc limit 1))[offset(0)].score
      - (array_agg(struct(quiz_date, score) order by quiz_date asc  limit 1))[offset(0)].score as improvement
from daily_quiz_scores
group by subject
order by subject
