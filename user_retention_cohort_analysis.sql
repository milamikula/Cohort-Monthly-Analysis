
--sql cohort script


with clean_userdata as --first cte 
(
select user_id, promo_signup_flag, 
to_date(replace(replace(split_part(trim(signup_datetime), ' ', 1), '/', '-'), '.', '-'), 'dd-mm-yy') as timestamp 
from cohort_users_raw cu
)
, clean_eventdata as -- second cte 
(
select user_id, event_type, revenue,
to_date(replace(replace(split_part(trim(event_datetime), ' ', 1), '/', '-'), '.', '-'), 'dd-mm-yy') as timestamp
from cohort_events_raw cer
)
, cte_3 as 
(
select 
u.user_id,
u.promo_signup_flag,
date_trunc('month', u.timestamp) as cohort_month, 
date_trunc ('month', e.timestamp) as activity_month,
extract
(month from age(
    date_trunc('month', e.timestamp),
    date_trunc('month', u.timestamp)
)) as month_offset
from clean_userdata u
join clean_eventdata e
on u.user_id=e.user_id
where 
u.timestamp is not null 
and e.timestamp is not null
and e.event_type is not null and e.event_type!= 'test_event'
)
select 
count (distinct user_id) as users_total, 
promo_signup_flag,
cohort_month,
month_offset
from cte_3 
where activity_month between '2025-01-01' and '2025-06-01' -
group by promo_signup_flag, cohort_month, month_offset 
order by promo_signup_flag, cohort_month, month_offset 

