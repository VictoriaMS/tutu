class Search < ApplicationRecord
  def find_route(first_station, last_station)
    Route.all.each do |route|
      sorted_route = route.railway_stations.ordered
      @route = route if sorted_route.first.id == first_station && sorted_route.last.id == last_station
    end
    @route
  end
end
