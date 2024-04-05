class Api::V1::SpotsController < Api::V1::BaseController
  before_action :set_spot, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[index show]

  def index
    spots = Spot.includes(:user, :addresses, :likes, :videos).all
    render json: spots, include: [:user, :address, :likes, :videos]
  end

  def create
    @_current_user = current_user
    spot = @_current_user.spots.new(spot_params)

    if spot.save
      render json: spot, status: :created
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
