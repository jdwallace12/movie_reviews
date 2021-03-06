class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @recent_movies = Movie.recent_three
    binding.pry
  end

  def show
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.new
    @reviews = @movie.reviews
    record_movie_view
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(params[:movie])
    flash[:notice] = "You have successfully added a new movie"
    redirect_to  movie_path(@movie)
  end

  private
  
  def record_movie_view
    ViewedMovie.create( user: current_user, movie: @movie )
  end
end
