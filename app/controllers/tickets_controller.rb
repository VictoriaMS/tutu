class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[destroy show]
  def index 
    @tickets = current_user.tickets 
  end

  def new 
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else 
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  def show  
    @train = @ticket.train 
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :first_name, :last_name, :passport_data) 
  end
end
