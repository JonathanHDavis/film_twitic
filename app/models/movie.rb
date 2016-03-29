class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :genre, presence: true
  belongs_to :genre
  has_many :reviews
end
