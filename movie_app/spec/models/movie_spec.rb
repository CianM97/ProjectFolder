require 'rails_helper'
# RSpec testing that will run through cmd with a command

RSpec.describe Movie, type: :model do
  it 'is valid with valid attributes' do
    movie = Movie.new(title: "Inception", release_year: 2010, director: "Christopher Nolan")
    expect(movie).to be_valid
  end

  it 'is invalid without a title' do
    movie = Movie.new(release_year: 2010, director: "Christopher Nolan")
    expect(movie).not_to be_valid
  end

  it 'is invalid without a release_year' do
    movie = Movie.new(title: "Inception", director: "Christopher Nolan")
    expect(movie).not_to be_valid
  end

  it 'is invalid without a director' do
    movie = Movie.new(title: "Inception", release_year: 2010)
    expect(movie).not_to be_valid
  end
end
