class BookingsController < ApplicationController
  before_action :set_ship, only: %i[show new create]

  def index
    @user = current_user
    @bookings = Booking.where(user: @user)
    @date = DateTime.now
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
      redirect_to ship_booking_path(id: @booking, ship_id: @ship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :ship_id)
  end
end
