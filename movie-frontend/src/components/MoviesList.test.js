import { render, screen, waitFor } from "@testing-library/react";
import axios from "axios";
import MockAdapter from "axios-mock-adapter";
import MoviesList from "./MoviesList";

const mock = new MockAdapter(axios);

test("fetches and displays movies from the API", async () => {
  mock.onGet("http://localhost:4000/movies").reply(200, [
    { id: 1, title: "Inception", release_year: 2010, director: "Christopher Nolan" },
  ]);

  render(<MoviesList />);
  await waitFor(() => screen.getByText(/Inception/i));
  expect(screen.getByText(/Inception/i)).toBeInTheDocument();
});

