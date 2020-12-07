class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      redirect_to room_room_url(@room)
    else
      render 'new'
    end
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count)
  end
end
