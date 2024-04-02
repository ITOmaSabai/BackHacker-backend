class Api::V1::VideosController < ApplicationController
  before_action: set_video, only: %i[show update destroy]

  def index
    videos = Video.all
    render json: videos
  end

  def create
    video = Video.new(video_params)
    if video.save
      render json: video, status: :created_at
    else
      render json: video.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: video
  end

  def update
    if video.update(video_params)
      render json: video
    else
      render json: video.errors, status: :unprocessable_entity
    end
  end

  def destroy
    video.destroy
  end

  private

  def video_params
    params.require(:video).permit(:youtube_video_id, :thumbnail_url, spots_id)
  end

  def set_video
    video = Video.fing(params[:id])
  end
end
