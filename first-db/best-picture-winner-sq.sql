SELECT movies.name, movies.earnings_rank FROM movies, oscars
WHERE movies.id = oscars.movie_id AND oscars.type = "Best-Picture"
ORDER BY movies.earnings_rank LIMIT 1;
