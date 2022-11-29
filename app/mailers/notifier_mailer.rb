class NotifierMailer < ApplicationMailer
  def booking_email(booking)
    @user = booking.users
    mail(to: @user.email, subject: 'Booking Confirmation')
  end
end
