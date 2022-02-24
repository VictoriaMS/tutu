class Admin::WagonsController < BaseController

  before_action :set_wagon, only: %i[show edit update destroy]
  before_action :set_train, only: %i[create new] 
  
  def index
    @wagons = Wagon.all
  end
  
  def new
    @wagon = @train.wagons.build
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    
    if @wagon.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def show
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :top_places, :bottom_places, :side_top_places, :side_bottom_places, :seat_places, :type)
  end
end
