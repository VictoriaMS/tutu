class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  validates :first_name, :last_name, :passport_data, :number, presence: true 

  before_validation :assing_number, :assing_stations
  after_create :send_purchase_notice
  after_destroy :send_cancellation_notice

  private

  def assing_number 
    self[:number] = Faker::Number.number(digits: 8)
  end

  def assing_stations
    self[:first_station_id] = self.train.route.first_station.id
    self[:last_station_id] = self.train.route.last_station.id
  end

  def send_purchase_notice
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancellation_notice
    TicketsMailer.canceling_ticket(self.user, self).deliver_now
  end
end
