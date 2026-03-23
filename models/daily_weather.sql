with daily_weather as (

    select 
    Date(time) as "Daily Weather",
    Weather,
    Temp,
    Pressure,
    Humidity,
    clouds
    from {{ source('Demo', 'WEATHER') }}
    limit 300
),

 daily_weather_agg as (

    select
    "Daily Weather",
    weather,
    round(avg(Temp), 2) as AVg_temp,
    round(avg(Pressure),2) as Avg_pressure,
    round(avg(Humidity),2) as Avg_Humidity,
    round(avg(clouds),2)  Avg_clouds

    from daily_weather
    group by weather, "Daily Weather" 
    qualify   row_number() over ( partition by "Daily Weather" order  by  count(weather) desc) =1

)
select * from daily_weather_agg