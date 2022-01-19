class SeatedWagon < Wagon
  validates :seating_places, presence: true
end
