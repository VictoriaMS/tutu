class AddColumnSerialNumberForWagons < ActiveRecord::Migration[5.2]
  def change
    add_column :wagons, :serial_number, :integer
    add_column :wagons, :number, :integer
  end
end
