class ReviewersController < ApplicationController
  
  def index
    @reviewers = User.all
  end

  def show
    @review = Review.new
    @reviews = @user.reviews
  end

end