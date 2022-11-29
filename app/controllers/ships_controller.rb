class ShipsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @ships = Ship.all
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.user = current_user
    if @ship.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :size, :price, :picture)
  end
end
