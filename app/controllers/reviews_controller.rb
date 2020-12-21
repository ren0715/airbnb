class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @reservation = Reservation.find_by(id: @review.reservation_id)
    if @reservation.reviews.where(user_id: @review.user_id, host_id: @review.host_id, guest_id: @review.guest_id).any?
      flash[:alert] = "You already reviewed this reservation."
      redirect_to request.referrer
    else
      if @review.save
        flash[:notice] = "Reviewed Successfully!"
        redirect_to request.referrer
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :host_id, :guest_id, :content, :rate, :reservation_id)
  end
end
