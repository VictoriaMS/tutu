class PlatzkartWagon < Wagon
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, presence: true
end
