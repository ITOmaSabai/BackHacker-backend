class Api::V1::CommentsController < Api::V1::BaseController
  skip_before_action :authenticate, only: %i[index]

  def index
    comments = Comment.includes(:user).all
    render json: comments, include: [:user]
  end

  def create
    @_current_user = current_user
    comment = @_current_user.comments.new(comment_params)

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :spot_id)
  end
end
