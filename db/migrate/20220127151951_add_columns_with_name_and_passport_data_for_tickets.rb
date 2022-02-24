class AddColumnsWithNameAndPassportDataForTickets < ActiveRecord::Migration[5.2]
  def change
    change_table :tickets do |t|
      t.string :first_name
      t.string :last_name
      t.string :passport_data
    end
  end
end
