class RoomsController < ApplicationController
  before_action :get_room, except: [:new, :create, :index]

  def index
    @rooms = current_user.rooms.paginate(page: params[:page], per_page: 10)
  end

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

  def update
    if @room.update(room_params)
      redirect_to request.referrer
    else
      render 'room'
    end
  end

  def room
  end

  def price
  end

  def description
  end

  def photos
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :price, :room_name, :summary, :address, :has_tv, :has_kitchen, :has_internet, :has_heating, :has_air_conditioning, :is_active)
  end

  def get_room
    @room = Room.find(params[:id])
  end
end
