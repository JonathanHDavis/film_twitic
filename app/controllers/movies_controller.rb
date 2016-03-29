class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @review = Review.new
    @reviews = @movie.reviews.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @genre = Genre.find(params[:movie][:genre_id])

    if @movie.save
      redirect_to genre_path(@genre), notice: "Movie was successfully added"
    else
       flash.now[:error] = "An error occured while saving this movie"
       render 'genres/show'
    end
  end

  def edit
  end

  def update

    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: "Movie was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this Movie"
      render :edit
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path, notice: "Movie was successfully deleted"
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre_id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
