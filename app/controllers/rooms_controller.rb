class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = RoomsTag.new
  end

  def create
    @room = RoomsTag.new(room_tag_params)
    if @room.valid?
      @room.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    set_room
    @comments = Comment.where(room_id:params[:id])
    @new_comment = Comment.new
  end
  
  private
  def room_tag_params
    params.require(:rooms_tag).permit(:heading,:category_id,:name).merge(user_id: current_user.id)
  end
  def set_room
    @room = Room.find(params[:id])
  end
end
