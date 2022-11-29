class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]
  before_action :set_ship, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    # @review.booking.ship = @ship
    if @review.save
      redirect_to ship_path(@ship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_ship
    @ship = Ship.find(params[:ship_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
