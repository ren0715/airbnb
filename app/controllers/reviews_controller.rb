class ReviewsController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new(review_params)
    
    if @reservation.review
      flash[:alert] = "You already reviewed this reservation."
      redirect_to request.referrer
    else
      @review.save
      flash[:notice] = "Reviewed Successfully!"
      redirect_to request.referrer
    end
  end

  private
  def review_params
    params.require(:review).permit(:host_id, :guest_id, :content, :reservation_id)
  end
end
