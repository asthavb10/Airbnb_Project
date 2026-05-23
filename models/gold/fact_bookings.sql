select 
    booking_id,
    listing_id,
    booking_date,
    nights_booked,
    booking_amount,
    cleaning_fee,
    service_fee,
    (booking_amount + cleaning_fee + service_fee) AS Total_revenue,
    booking_status,
    created_at
from {{ref('s_bookings')}}