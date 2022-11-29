class ShipsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_ship, only: %i[show update edit destroy]

  def index
    @ships = Ship.all
  end

  def show
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

  def update
    @ship.update(ship_params)
    redirect_to ship_path(@ship)
  end

  def edit
  end

  def destroy
    @ship.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.require(:ship).permit(:name, :size, :price, :picture)
  end
end
