class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[show edit update destroy update_position update_departure_time update_arrival_time]
  before_action :set_route, only: %i[update_position update_arrival_time update_departure_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show; end

  def new
    @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
    
    if @railway_station.save 
      redirect_to [:admin, @railway_station]
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_stations_url
    else 
      redirect_to admin_railway_stations_url
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_url
  end

  def update_position
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_departure_time
    @railway_station.update_departure_time(@route, params[:departure_time])
    redirect_to [:admin, @route]
  end

  def update_arrival_time
    @railway_station.update_arrival_time(@route, params[:arrival_time])
    redirect_to [:admin, @route]
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
