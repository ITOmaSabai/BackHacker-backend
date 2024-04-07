class Api::V1::SpotsController < Api::V1::BaseController
  before_action :set_spot, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[index show]

  def index
    spots = Spot.includes(:user, :addresses, :likes, :videos).all
    render json: spots, include: [:user, :address, :likes, :videos]
  end

  def create
    @_current_user = current_user
    spot = @_current_user.spots.new(spot_params.except(:address_components, :formatted_address))

    if spot.save
      address = AddressService.save_address_from_address_components(spot_params[:address_components], spot_params[:formatted_address], spot.id)
      render json: {spot: spot, address: address}, status: :created
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
    params.require(:spot).permit(:name, :description, :lat, :lng, :user_id, :formatted_address, address_components: [:long_name, :short_name, types: []])
  end

  def set_spot
    spot = Spot.find(paramas[:id])
  end
end
