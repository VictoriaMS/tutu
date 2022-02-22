class WagonsConversionForSti < ActiveRecord::Migration[5.2]
  def change
    change_table :wagons do |t|
      t.integer :side_top_places
      t.integer :side_bottom_places
      t.integer :seat_places
      t.string :type
      t.remove :type_of_wagon
    end
  end
end
