class ReviewsController < ApplicationController

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = @reservation.reviews.new(review_params)
    
    if @reservation.reviews.where(host_id: @review.host_id, guest_id: @review.guest_id).any?
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
    params.require(:review).permit(:host_id, :guest_id, :content, :rate)
  end
end
