import { render, screen, fireEvent } from "@testing-library/react";
import SearchBar from "./SearchBar";

test("calls onSearch with the correct input", () => {
  const mockOnSearch = jest.fn();
  render(<SearchBar onSearch={mockOnSearch} />);
  const input = screen.getByPlaceholderText(/search for a movie/i);
  fireEvent.change(input, { target: { value: "Inception" } });
  fireEvent.submit(input);
  expect(mockOnSearch).toHaveBeenCalledWith("Inception");
});
