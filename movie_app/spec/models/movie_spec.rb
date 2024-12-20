require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "is valid with a title, director, and release_year" do
    movie = Movie.new(title: "Inception", director: "Nolan", release_year: 2010)
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.new(director: "Nolan")
    expect(movie).not_to be_valid
    expect(movie.errors[:title]).to include("can't be blank")
  end
end
