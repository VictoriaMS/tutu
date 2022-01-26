class WagonsController < ApplicationController

  before_action :set_wagon, only: %i[show edit update destroy]
  before_action :set_train, only: %i[create new] 
  
  def index
    @wagons = type_class.all
  end
  
  def new
    @wagon = type_class.new
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    
    if @wagon.save
      redirect_to @train
    else
      render :new
    end
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :top_places, :bottom_places, :side_top_places, :side_bottom_places, :seating_places, :type)
  end
end
