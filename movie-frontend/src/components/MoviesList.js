import React, { useState, useEffect } from "react";
import axios from "axios";
import SearchBar from "./SearchBar";
import AddMovieForm from "./AddMovieForm";
//imports to pull from my other .js files created.

//crates an array so that when the application starts it knows it needs to have an array
//this isnt here react wont open
const MoviesList = () => {
  const [movies, setMovies] = useState([]);
  const [query, setQuery] = useState("");

  //this is to fill the arrays that have been created above
  //data is pulled from the backend as shown with the url.
  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await axios.get(
          `http://localhost:4000/movies?q[title_cont]=${query}`
        );
        setMovies(response.data);
      } catch (error) {
        console.error("Error fetching movies:", error);
      }
    };

    fetchMovies();
  }, [query]);

  //method used in the SearchBar.js file
  const handleSearch = (searchQuery) => {
    setQuery(searchQuery);
  };

  const handleMovieAdded = (newMovie) => {
    setMovies((prevMovies) => [...prevMovies, newMovie]);
  };

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Movie List</h1>
      <SearchBar onSearch={handleSearch} />
      <AddMovieForm onMovieAdded={handleMovieAdded} />
      <ul className="list-group mt-4">
  {Array.isArray(movies) ? (
    movies.map((movie) => (
      <li key={movie.id} className="list-group-item">
        <strong>{movie.title}</strong> - {movie.release_year} - Directed by {movie.director}
      </li>
    ))
  ) : (
    <li className="list-group-item">No movies available.</li>
  )}
</ul>

    </div>
  );
};

export default MoviesList;


