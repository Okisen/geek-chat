class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end
  
  private
  def room_params
    params.require(:room).permit(:heading,:category_id).merge(user_id: current_user.id)
  end
end
