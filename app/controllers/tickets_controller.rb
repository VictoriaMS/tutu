class TicketsController < ApplicationController
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

  def show  
    @ticket = Ticket.find(params[:id])
    @train = @ticket.train 
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :user_id, :first_name, :last_name, :passport_data) 
  end
end
