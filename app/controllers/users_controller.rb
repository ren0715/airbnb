class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms.where(is_active: true).paginate(page: params[:page], per_page: 6)
  end
end
