class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    if @ship.save
      redirect_to ships_path
    else
      render :new
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :price)
  end
end
