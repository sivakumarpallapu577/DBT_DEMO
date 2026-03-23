with BIKE as(

    select 
    distinct
    START_STATIO_ID AS start_station_id,
    start_station_name as Station_Name,
    start_lat as Station_lat,
    start_lng as Station_long
    from {{ source('Demo', 'BIKE') }}
    where RIDE_ID != 'ride_id'
    limit 10
)

select * from BIKE