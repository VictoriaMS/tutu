class Wagon < ActiveRecord::Base 
  belongs_to :train, optional: true

  before_save :set_serial_number 

  validates :number, presence: true
  validates :number, uniqueness: {scope: :train_id}

  scope :sorted, -> (in_order) { in_order ? order(serial_number: :asc) : order(serial_number: :desc) }
  scope :coupe_wagons, -> {where(type: 'CoupeWagon')}
  scope :economy_wagons, -> {where(type: 'EconomyWagon')}
  scope :seated_wagons, -> {where(type: 'SeatedWagon')}
  scope :sleeping_wagons, -> {where(type: 'SleepingWagon')}

  protected 

  def set_serial_number 
    self.serial_number = train.wagons.maximum('number') + 1 unless train.nil? 
  end
end
