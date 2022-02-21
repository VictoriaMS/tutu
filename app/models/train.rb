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

  def count_of_places(type_wagon, type_place)
    wagons.where(type: type_wagon.to_s).sum {|wagon| wagon.send(type_place.to_sym) }
  end
end
