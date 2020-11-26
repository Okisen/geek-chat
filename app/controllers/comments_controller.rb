class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to room_path(params[:room_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(related_id: comment_count+1, user_id: current_user.id, room_id: params[:room_id])
  end

  def comment_count
    comment_count = Comment.where(room_id:params[:room_id]).count
  end
end
