SELECT movies.name, movies.earnings_rank FROM movies, oscars
WHERE movies.id = oscars.movie_id 
ORDER BY movies.earnings_rank LIMIT 1;
