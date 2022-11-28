class ShipsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    if @ship.save
      redirec_to ship_path(@ship)
    else
      render :new
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :price)
  end
end
