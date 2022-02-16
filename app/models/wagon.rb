class Wagon < ActiveRecord::Base 
  belongs_to :train

  validates :type_of_wagon, :top_places, :bottom_places, presence: true
end
