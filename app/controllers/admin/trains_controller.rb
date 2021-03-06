class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: %i[show edit update destroy]

  def index
    @trains = Train.all
  end

  def show; end

  def new
    @train = Train.new
  end

  def edit; end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to admin_trains_url
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_url
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :in_order)
  end
end
