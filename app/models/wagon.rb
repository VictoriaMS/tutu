class Wagon < ActiveRecord::Base 
  belongs_to :train, optional: true

  before_save :set_serial_number 

  validates :number, presence: true, uniqueness: { scope: :train_id }

  protected 

  def set_serial_number 
    self.serial_number = train.wagons.count + 1 unless train.nil? 
  end
end
