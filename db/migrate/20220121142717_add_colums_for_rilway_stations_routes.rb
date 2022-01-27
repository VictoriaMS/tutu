class AddColumsForRilwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    change_table :railway_stations_routes do |t|
      t.datetime :departure_time
      t.datetime :arrival_time
    end
  end
end
