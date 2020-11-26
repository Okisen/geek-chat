class TagsController < ApplicationController
  def create
    @room = Room.find(params[:room_id]) 
    @tag = Tag.create(name:params[:name])
    RoomTagRelation.create(room_id: @room.id, tag_id: @tag.id)
    redirect_to room_path(params[:room_id])
  end
  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
