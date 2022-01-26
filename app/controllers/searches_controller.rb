class SearchesController < ApplicationController
  def show 
    @stations = RailwayStation.all
    @search = Search.new
  end

  def find
    @search = Search.new
    @route = @search.find_route(params[:first_station], params[:last_station])
    redirect_to @route
  end
end
