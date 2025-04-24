SELECT
movie_id,
month,
location,
tickets_sold
FROM {{ ref('nj_cinemas_overview') }}
WHERE tickets_sold < 50