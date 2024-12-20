import React, { useEffect, useState } from 'react';
import axios from 'axios';

const MoviesList = () => {
  const [movies, setMovies] = useState([]);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        // Fetch data from Rails backend
        // const response = await axios.get('http://localhost:4000/movies');
        // Rails currently renders the search form in HTML, but also supports JSON.
        // Because we've set `config.api_only = false` and inherited from `ActionController::Base`,
        // to get JSON from the backend, ensure your index action or request includes a format: JSON or update the code to return JSON.
        // For now, let's assume we can get JSON by adding `.json` to the URL:
         const response = await axios.get('http://localhost:4000/movies.json');
        //
        // If you haven't enabled JSON responses explicitly, we’ll adjust the backend:
        // In your MoviesController#index, after setting @movies, add:
        // render json: @movies to ensure JSON is returned when requested.
        
        setMovies(response.data);
      } catch (error) {
        console.error("Error fetching movies:", error);
      }
    };
    fetchMovies();
  }, []);

  return (
    <div>
      <h1>Movies from the Rails API</h1>
      {movies.length > 0 ? (
        <ul>
          {movies.map(movie => (
            <li key={movie.id}>
              {movie.title} - {movie.release_year} - {movie.director}
            </li>
          ))}
        </ul>
      ) : (
        <p>No movies available.</p>
      )}
    </div>
  );
};

export default MoviesList;
