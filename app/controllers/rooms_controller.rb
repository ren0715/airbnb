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

  def show
    @reservation = @room.reservations.new
  end

  def update
    @final_params = is_ready?(@room) ? room_params.merge(is_active: true) : room_params
    if @room.update(@final_params)
      if @room.is_active
        redirect_to root_url
      else
        redirect_to request.referrer
      end
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

  def preload
    today = Date.today
    reservations = @room.reservations.where("start_date >= ? OR end_date >= ?",today,today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date, @room)
    }

    render json: output
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :price, :room_name, :summary, :address, :has_tv, :has_kitchen, :has_internet, :has_heating, :has_air_conditioning)
  end

  def get_room
    @room = Room.find(params[:id])
  end

  def is_conflict(start_date, end_date, room)
    check = room.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0 ? true : false
  end
end
