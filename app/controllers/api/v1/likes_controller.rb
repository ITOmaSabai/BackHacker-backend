class Api::V1::LikesController < Api::V1::BaseController
  def create
    @_current_user = current_user
    like = @_current_user.likes.new(like_params)
    if like.save
      render json: like, status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like&.destroy
    head :no_content
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :spot_id)
  end
end
