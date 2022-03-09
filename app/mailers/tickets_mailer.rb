class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You bought a ticket')
  end
end
