class Api::V1::SpotsController < Api::V1::BaseController
  before_action :set_spot, only: %i[show update destroy]
  skip_before_action :authenticate, only: %i[index show]

  def index
    spots = Spot.includes(:user, :address, :likes, :videos).all
    render json: spots, include: [:user, :address, :likes, :videos]
  end

  def create
    @_current_user = current_user
    spot = @_current_user.spots.new(spot_params.except(:address_components, :formatted_address))

    if spot.save
      logger.debug(spot.id)
      address = AddressService.save_address_from_address_components(spot_params[:address_components], spot_params[:formatted_address], spot.id)
      videos = VideoService.call(spot.id, keyword: "#{address[1]} #{address[2]} walking tour")

      render json: {spot: spot, address: address, videos: videos}, status: :created
    else
      render json: spot.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @spot
  end

  def update
    if @spot.update(spot_params)
      render json: @spot
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @_current_user = current_user

    if @spot.destroy
      render json: {}, status: :no_content
    else
      render json: { error: "削除に失敗しました" }, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :lat, :lng, :formatted_address, address_components: [:long_name, :short_name, types: []])
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
