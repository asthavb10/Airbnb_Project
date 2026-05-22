with source as (
    select *
    from {{ source('bronze', 'BOOKINGS') }}
),
cleaned as (
    select
        booking_id,
        listing_id,

        
        case
            when booking_date is null 
              or trim(cast(booking_date as varchar)) = ''
            then date '1900-01-01'
            else booking_date
        end as booking_date,

        
        case
            when nights_booked is null
              or trim(cast(nights_booked as varchar)) = ''
              or nights_booked = 0
            then 1
            else nights_booked
        end as nights_booked,

        case
            when booking_amount is null
              or trim(cast(booking_amount as varchar)) = ''
            then 0
            else booking_amount
        end as booking_amount,

        case
            when cleaning_fee is null
              or trim(cast(cleaning_fee as varchar)) = ''
            then 0
            else cleaning_fee
        end as cleaning_fee,

        case
            when service_fee is null
              or trim(cast(service_fee as varchar)) = ''
            then 0
            else service_fee
        end as service_fee,

        
        case 
            when booking_status is null or trim(booking_status) = '' 
            then 'UNKNOWN'
            else trim(booking_status)
        end as booking_status,

        coalesce(created_at, current_timestamp) as created_at

    from source
    where booking_id is not null
      and trim(cast(booking_id as varchar)) != ''   
      and listing_id is not null
      and trim(cast(listing_id as varchar)) != ''   
)
select * from cleaned