class SearchesController < ApplicationController
  def show 
    @routes = Route.search_by(params[:first_station], params[:last_station])
    @stations = RailwayStation.all
    @trains = @routes.map {|route| route.trains }.flatten
  end
end
