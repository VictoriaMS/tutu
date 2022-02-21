class AddcolumnSerailNumberToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :serial_number, :integer
  end
end
