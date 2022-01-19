class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true

  scope :stations_in_order, ->(route) { route.railway_stations.order(:serial_number) }
end
