class CreateWagons < ActiveRecord::Migration[5.2]
  def change
    create_table :wagons do |t|
      t.string :type_of_wagon
      t.integer :bottom_places
      t.integer :top_places
      t.references :train

      t.timestamps
    end
  end
end
