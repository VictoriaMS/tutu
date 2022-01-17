class Wagon < ActiveRecord::Base 
  belongs_to :train

  validates :type_of_wagon, presence: true
  validates :top_places, presence: true
  validates :bottom_places, presence: true
end
