class CommentsController < ApplicationController
  def index
    @comments = Comment.where(room_id:params[:room_id])
    # binding.pry
    @new_comment = Comment.new
  end

  def new
  end
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to action: :index
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(related_id: comment_count+1,good: 0, user_id: current_user.id, room_id: params[:room_id])
  end

  def comment_count
    comment_count = Comment.where(room_id:params[:room_id]).count
  end
end
