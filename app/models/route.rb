class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true

  def self.search_by(first_station_id, last_station_id)
    routes = joins(:railway_stations_routes).where(railway_stations_routes: {railway_station_id: [first_station_id, last_station_id] }).uniq
    routes.select {|route| route.railway_stations.find_by(id: first_station_id ) && route.railway_stations.find_by(id: last_station_id) }
  end

  def first_station
    railway_stations.ordered.first
  end

  def last_station
    railway_stations.ordered.last
  end 

  def departure_time_first_station
    railway_stations.ordered.first.departure_time(self)
  end

  def arrival_time_last_station
    railway_stations.ordered.last.arrival_time(self)
  end
end
