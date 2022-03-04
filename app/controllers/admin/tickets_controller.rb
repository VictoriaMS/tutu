class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: %i[show destroy edit update] 
  before_action :users, only: %i[edit new]

  def index 
    @tickets = Ticket.all
  end

  def show 
  end

  def destroy 
    @ticket.destroy 
    redirect_to admin_tickets_url
  end 

  def edit
    @trains = Train.all
  end 
  
  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :edit
    end
  end

  def new 
    @ticket = Ticket.new
    @route = Route.find(params[:id])
  end 

  def create
    @ticket = Ticket.new(ticket_params)
    
    if @ticket.save 
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  private

  def users 
    @users = User.where(admin: false)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :first_name, :last_name, :passport_data)
  end
end
