class Api::V1::SpotController < ApplicationController
  before_action: set_spot, onlu: %i[show update destroy]

  def index
    spots = Spot.includes(:user, :addresses, :likes, :videos).all
    render json: spots, include: [:user, :address, :likes, :videos]
  end

  def create
    spot = Spot.new(spot_params)

    if spot.save
      render json: spot, status: :created_at
    else
      render json: spot.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: spot
  end

  def update
    if spot.update(spot_params)
      render json: spot
    else
      render json: spot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    spot.destroy
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :lat, :lng, :user_id)
  end

  def set_spot
    spot = Spot.find(paramas[:id])
  end
end
