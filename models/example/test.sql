WITH BIKE_DATA AS (
    SELECT * FROM  {{ source('Demo', 'BIKE') }}
     )
SELECT * FROM BIKE_DATA

limt 10