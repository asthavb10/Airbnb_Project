with new_date as (
    select
        dateadd('day', seq4(), date '2015-01-01') as date_day
    from table(generator(rowcount => 5000))
)
select
    date_day                                        as date_key,
    year(date_day)                                  as year,
    quarter(date_day)                               as quarter,
    month(date_day)                                 as month,
    dayofweek(date_day)                             as day_of_week,
    monthname(date_day)                             as month_name,
    dayname(date_day)                               as day_name,
    case
        when dayofweek(date_day) in (1, 7) then true
        else false
    end                                             as is_weekend
from new_date