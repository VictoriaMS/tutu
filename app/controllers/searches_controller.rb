class SearchesController < ApplicationController
  def show 
    @stations = RailwayStation.all
  end

  def new 
    @routes = Route.search_by(params[:first_station], params[:last_station])
    @trains = @routes.map {|route| route.trains }.flatten
    render :show 
  end
end
