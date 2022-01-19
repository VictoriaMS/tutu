class EconomyWagon < Wagon
  validates :bottom_places, presence: true 
  validates :top_places, presence: true
  validates :side_top_places, presence: true
  validates :side_bottom_places, presence: true
end
