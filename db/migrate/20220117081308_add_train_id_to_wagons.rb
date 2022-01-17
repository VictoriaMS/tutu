class AddTrainIdToWagons < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :wagons, :train
  end
end
