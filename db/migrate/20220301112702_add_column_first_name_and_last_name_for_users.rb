class AddColumnFirstNameAndLastNameForUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :last_name
      t.rename :name, :first_name
    end
  end
end
