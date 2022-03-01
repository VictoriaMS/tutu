class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: %i[show destroy] 

  def index 
    @tickets = Ticket.all
  end

  def show 
  end

  def destroy 
    @ticket.destroy 
    redirect_to admin_tickets_url
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

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :first_name, :last_name, :passport_data)
  end
end
