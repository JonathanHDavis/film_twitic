class ReviewersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
    
  def index
    @reviewers = User.all
  end

  def show
    @review = Review.new
    @reviews = @user.reviews.order(created_at: :desc)
  end

  def find_user
    @user = User.find(params[:id])
  end
end