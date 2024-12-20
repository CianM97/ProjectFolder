require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies" do
    it "returns http success" do
      get movies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /movies" do
    it "creates a movie with valid parameters" do
      post movies_path, params: { movie: { title: "Avatar", director: "Cameron", release_year: 2009 } }
      expect(response).to have_http_status(:redirect) # since we're redirecting after create
      follow_redirect!
      expect(response.body).to include("Avatar")
    end
  end
end
