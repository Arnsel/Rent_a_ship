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
      redirect_to ship_booking_path(@booking)
    else
      render :new
    end
  end

  private

  def ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :ship_id, :id)
  end
end
