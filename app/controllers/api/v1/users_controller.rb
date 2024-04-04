class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
  end

  def show
    @_current_user = current_user
    user_with_relations = User.includes(:spots, :likes).find(@_current_user.id)

    if user_with_relations
      render json: user_with_relations.as_json(include: [:spots, :likes])
    else
      render json: {}, status: :not_found
    end
  end

  def edit
    @_current_user = current_user
  end

  def update
    @_current_user = current_user
    @_current_user.update(user_params)
  end

  def destroy
    user = User.find_by(uid: params[:id])
    if user
      user.destroy
      render json: { message: '退会処理が完了しました' }, status: :ok
    else
      render json: { error: 'ユーザーが見つかりませんでした' }, status: :not_found
    end
  end

  private
  def user_params
    params.require(:urer).permit(:name, :uid, :avatar)
  end
end
