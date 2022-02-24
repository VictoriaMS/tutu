class CreateWagons < ActiveRecord::Migration[5.2]
  def change
    create_table :wagons do |t|
      t.string :type_of_wagon
      t.integer :number
      t.integer :serial_number
      t.integer :top_places
      t.references :train
      t.integer :bottom_places 
      t.integer :seating_places 

      t.timestamps
    end
  end
end
