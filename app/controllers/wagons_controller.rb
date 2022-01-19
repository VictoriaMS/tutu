class WagonsController < ApplicationController
  before_action :set_wagon, only: %i[show edit update destroy]
<<<<<<< HEAD
  
=======
  before_action :set_type

>>>>>>> Created homework 16
  def index
    @wagons = type_class.all
  end
  
  def new
    @wagon = type_class.new
  end

  def create
    @wagon = Wagon.new(wagon_params)
    
    if @wagon.save
      redirect_to @wagon
    else
      render :new
    end
  end

  def show; end

  private

  def set_wagon
    @wagon = type_class.find(params[:id])
  end

  def set_type
    @type = type
  end

  def type
    Wagon.types.include?(params[:type]) ? params[:type] : 'Wagon'
  end

  def type_class
    type.constantize
  end

  def wagon_params
    params.require(:wagon).permit(:number, :top_places, :bottom_places, :side_top_places, :side_bottom_places, :seating_places, :train_id, :type)
  end
end
