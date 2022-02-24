class SeatedWagon < Wagon
  validates :seat_places, presence: true
end
