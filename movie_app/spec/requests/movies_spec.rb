require 'rails_helper'

RSpec.describe "Movies API", type: :request do
  let!(:movies) { create_list(:movie, 3) }
  let(:movie_id) { movies.first.id }

  describe "GET /movies" do
    it "returns all movies" do
      get "/movies"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /movies" do
    it "creates a new movie" do
      valid_attributes = { movie: { title: "Inception", release_year: 2010, director: "Christopher Nolan" } }
      post "/movies", params: valid_attributes.to_json, headers: { "Content-Type" => "application/json" }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("Inception")
    end
  end


  describe "GET /movies/:id" do
    it "returns a specific movie" do
      get "/movies/#{movie_id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /movies/:id" do
    it "deletes a movie" do
      delete "/movies/#{movie_id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
