class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @movie = Movie.find(params[:review][:movie_id])
    @reviewer = User.find(params[:review][:user_id])
 
    if @review.save
      redirect_to movie_path(@movie), notice: "Review was successfully added"
    else
       flash.now[:error] = "An error occured while saving this review"
       render 'movies/show'
    end
  end
 
  private
 
  def review_params
    params.require(:review).permit(:title, :content, :movie_id, :user_id)
  end
end
