class BookingsController < ApplicationController
  before_action :ship, only: %i[show new create]

  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.ship = @ship
    if @booking.save!
      NotifierMailer.with(booking: @booking).booking_email.deliver_later
      flash[:success] = "Thank you for your order! We'll get contact you soon!"
      redirect_to root_path
    else
      flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
      render :new
    end
  end

  private

  def ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :ship_id)
  end
end
