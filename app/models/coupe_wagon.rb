class CoupeWagon < Wagon 
  validates :top_places, :bottom_places, presence: true
end
