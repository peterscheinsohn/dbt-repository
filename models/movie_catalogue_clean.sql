SELECT
    movie_id,
    movie_title,
    COALESCE(genre, 'unknown') AS genre,
    studio
FROM
    {{  source('movie_catalogue', 'movie_catalogue')  }}    