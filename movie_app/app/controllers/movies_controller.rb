class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show, :update, :destroy ]

  # GET /movies
  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result
    respond_to do |format|
      format.html  # renders index.html.erb
      format.json { render json: @movies } # returns JSON if requested
    end
  end

  # GET /movies/:id
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie created successfully."
    else
      render :new
    end
  end

  # PATCH/PUT /movies/:id
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "Movie updated successfully."
    else
      render :edit
    end
  end

  # DELETE /movies/:id
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
