class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.user = current_user
    # current_user - This replaced User.last. Waiting for login Gem to be finished.
    if @ship.save!
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
