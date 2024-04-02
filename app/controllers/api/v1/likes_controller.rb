class Api::V1::LikesController < ApplicationController
  def create
    like = user.likes.new(like_params)
    if like.save
      render json: like, status: :created
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:like])
    like.destroy
  end
end
