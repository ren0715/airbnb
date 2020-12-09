class RoomsController < ApplicationController
  before_action :get_room, except: [:new]

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

  def room
  end

  def price
  end

  def description
  end

  def photos
  end

  def amenities
  end

  def location
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count)
  end

  def get_room
    @room = Room.find(params[:id])
  end
end
