class LikesController < ApplicationController
  before_action :find_like, only: :destroy
  
  def create
    @like = Like.create(user_id: current_user.id, comment_id: params[:comment_id])
    redirect_to room_comments_path
  end

  def destroy
    @like.destroy
    redirect_to room_comments_path
  end

  private
  def find_like
    @like = Like.find(params[:id])
  end
end
