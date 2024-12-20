class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :update, :destroy ]

  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result
    render json: @movies, status: :ok
  end

  def show
    render json: @movie
  end


  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie created successfully."
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "Movie updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    head :no_content
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end


  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, :director)
  end
end
