class NotifierMailer < ApplicationMailer

  def booking_email
    @booking = params[:booking]

    mail(to: 'Jbarkerlouth@gmail.com', subject: "You got a new order!")
  end
end
