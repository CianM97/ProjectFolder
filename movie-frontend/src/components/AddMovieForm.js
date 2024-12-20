import React, { useState } from "react";
import axios from "axios";

const AddMovieForm = ({ onMovieAdded }) => {
  //varibles to store input values
  const [title, setTitle] = useState("");
  const [releaseYear, setReleaseYear] = useState("");
  const [director, setDirector] = useState("");

  //fucntion to handle form submit
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      //sends a post request using axios to send data to backend
      const response = await axios.post("http://localhost:4000/movies", {
        movie: { title, release_year: releaseYear, director },
      });
      //reset input fields
      onMovieAdded(response.data);
      setTitle("");
      setReleaseYear("");
      setDirector("");
    } catch (error) {
      console.error("Error adding movie:", error);
    }
  };

  //This is the form that the user sees on the website and this is returned to the backend whenever a new movie is added
  return (
    //calls the handleSubmit function when the button is pressed.
    <form className="mb-4" onSubmit={handleSubmit}>
      <div className="mb-3">
        <label className="form-label">Title</label>
        <input
          type="text"
          className="form-control"
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
      </div>
      <div className="mb-3">
        <label className="form-label">Release Year</label>
        <input
          type="number"
          className="form-control"
          value={releaseYear}
          onChange={(e) => setReleaseYear(e.target.value)}
        />
      </div>
      <div className="mb-3">
        <label className="form-label">Director</label>
        <input
          type="text"
          className="form-control"
          value={director}
          onChange={(e) => setDirector(e.target.value)}
        />
      </div>
      <button type="submit" className="btn btn-success">
        Add Movie
      </button>
    </form>
  );
};

export default AddMovieForm;
