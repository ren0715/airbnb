class PagesController < ApplicationController
  def home
    @rooms = Room.where(is_active: true).paginate(page: params[:page], per_page: 6)
    #@reviews = Review.where.not('? == ?',:user_id,:host_id)
    @reviews = Review.all
    # @reviews.each do |review|
    #   review.user_id == reveiw.host_id 
    # end
  end

  def search
    # step 1 get the location and assign to a variable
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    else
      session[:loc_search] = ""
    end
    # step 2 filter using address.
    if session[:loc_search] && session[:loc_search] != ""
      @room_address = Room.where(is_active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @room_address = Room.where(is_active: true)
    end
    # step 3 filter using ransack.
    @search = @room_address.ransack(params[:q])
    @rooms = @search.result

    @rooms_array = @rooms.to_a
    # step 4 filter using the date.
    if params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|
        not_available = room.reservations.where(
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)

        if not_available.length > 0
          @rooms_array.delete(room)
        end
      end
    end
  end
end
