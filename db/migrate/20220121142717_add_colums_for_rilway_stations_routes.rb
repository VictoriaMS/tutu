class AddColumsForRilwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    change_table :railway_stations_routes do |t|
      t.date :departure_time
      t.date :arrival_time
    end
  end
end
