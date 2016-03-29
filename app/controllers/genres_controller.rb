class GenresController < ApplicationController

  before_action :find_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
    @movie = Movie.new
    @movies = @genre.movies.order(created_at: :desc)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      flash[:notice] = "Genre was successfully created"
      redirect_to genre_path(@genre)
    else
      flash.now[:error] = "An error occurred while saving this genre"
      render :new
    end
  end

  def edit
  end

  def update

    if @genre.update(genre_params)
      redirect_to genre_path(@genre), notice: "Genre was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this Genre"
      render :edit
    end
  end

  def destroy
    @genre.destroy

    redirect_to genres_path, notice: "Genre was successfully deleted"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre
    @genre = Genre.find(params[:id])
  end
end
