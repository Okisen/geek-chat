class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @comment = Comment.new
  end

  def new
  end
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to action: :index
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
