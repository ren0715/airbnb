class PagesController < ApplicationController
  def home
    @rooms = Room.where(is_active: true).paginate(page: params[:page], per_page: 6)
  end
end
