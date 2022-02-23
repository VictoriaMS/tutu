class Train < ActiveRecord::Base
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  has_many :tickets
  has_many :wagons

  def sorted_wagons
    wagons.sorted(in_order)
  end

  def counting_places(type_wagon, type_places)
    wagons.where(type: type_wagon.to_s).sum { |wagon| wagon.send(type_places.to_sym) }
  end
end
