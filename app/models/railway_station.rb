class RailwayStation < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets, foreign_key: :first_station_id
  has_many :tickets, foreign_key: :last_station_id

  validates :title, presence: true

  scope :in_order, -> {order(:serial_number)}

  def update_position(route, serial_number)
    route_station = route_station(route)
    route_station.update(serial_number: serial_number) unless route_station.nil?
  end

  def position_in(route)
    route_station(route).serial_number
  end

  def update_departure_time(route, departure_time)
    route_station = route_station(route)
    route_station.update(departure_time: departure_time) unless route_station.nil?
  end

  def departure_time(route)
    route_station(route).departure_time
  end

  def update_arrival_time(route, arrival_time)
    route_station = route_station(route)
    route_station.update(arrival_time: arrival_time) unless route_station.any?
  end

  def arrival_time(route)
    route_station(route).arrival_time
  end

  protected

  def route_station (route)
    @route_station ||= railway_stations_routes.where(route: route).first
  end
end
