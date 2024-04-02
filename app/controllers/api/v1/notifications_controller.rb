class Api::V1::NotificationsController < ApplicationController
  def index
    notifications = Notification.all
    render json: notifications
  end

  def create
    notification = Notification.new(notification_params)
    if notification.save
      render json: notification, status: :created
    else
      render json: notification.errors, status: :unprocessable_entity
    end
  end

  def update
    notification = Notification.find(params[:id])
    if notification.update
      render json: notification, status: :success
    else
      render json: notification.errors, status: :unprocessable_entity
    end
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
  end

  private

  def notification_params
    params.require(:notification).permit(:content, :users_id, :spots_id)
  end
end
