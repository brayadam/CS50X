SELECT title, rating
FROM(SELECT movies.id, movies.title, movies.year, ratings.rating FROM movies INNER JOIN ratings ON movies.id=ratings.movie_id)
WHERE year = "2010" ORDER BY rating DESC, title ASC;