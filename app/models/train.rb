class Train < ActiveRecord::Base
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  has_many :tickets
  has_many :wagons

  def compartment_wagons 
    wagons.select { |wagon| wagon.type_of_wagon == 'compartment' }
  end

  def econom_class_wagons
    wagons.select { |wagon| wagon.type_of_wagon == 'econom-class' }
  end

  def count_places(type_place, wagons)
    self.send(wagons.to_sym).inject(0) { |places, wagon| places += wagon.send(type_place.to_sym) }
  end
end
