class AddBooleanColumnForTrains < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :in_order, :boolean, default: false, nil: false
  end
end
