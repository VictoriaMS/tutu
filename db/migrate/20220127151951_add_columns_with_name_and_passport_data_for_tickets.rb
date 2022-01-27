class AddColumnsWithNameAndPassportDataForTickets < ActiveRecord::Migration[5.2]
  def change
    change_table :tickets do |t|
      t.string :full_name
      t.string :passport_data
    end
  end
end
