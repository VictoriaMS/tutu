class Wagon < ActiveRecord::Base 
  belongs_to :train, optional: true

  before_save :set_serial_number 

  validates :number, presence: true, uniqueness: { scope: :train_id }

  scope :sorted, -> (in_order) { in_order ? order(serial_number: :asc) : order(serial_number: :desc) }

  protected 

  def set_serial_number 
    self.serial_number = train.wagons.maximum('number') + 1 unless train.nil? 
  end
end
