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
    @rooms = Room.where(is_active: true)
  end
end
