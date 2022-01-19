class AddSerialNumberForStationOnRoute < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :serial_number, :Integer
  end
end
