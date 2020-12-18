class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @rooms = @user.rooms.where(is_active: true).paginate(page: params[:page], per_page: 6)
    @reviews = Review.all
    
    @num1 = 0
    @num2 = 0

    @rooms.each do |room|
      @num1 += room.guest_reviews.count
      @num2 += room.host_reviews.count
    end
  end
end
