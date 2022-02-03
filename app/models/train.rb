class Train < ActiveRecord::Base
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true

  has_many :tickets
  has_many :wagons

  def compartment_wagons 
    self.wagons.select {|wagon| wagon.type_of_wagon == 'compartment' }
  end

  def econom_class_wagons
    self.wagons.select {|wagon| wagon.type_of_wagon == 'econom-class' }
  end

  def count_top_places(type)
    if type == 'compartment'
      self.compartment_wagons.inject(0) {|places, wagon| places += wagon.top_places }
    else 
      self.econom_class_wagons.inject(0) {|places, wagon| places += wagon.top_places }
    end
  end

  def count_bottom_places(type)
    if type == 'compartment'
      self.compartment_wagons.inject(0) {|places, wagon| places += wagon.bottom_places }
    else 
      self.econom_class_wagons.inject(0) {|places, wagon| places += wagon.bottom_places }
    end
  end
end
