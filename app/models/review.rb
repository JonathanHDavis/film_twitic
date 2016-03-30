class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  validates :content, length: { maximum: 140 }
end
