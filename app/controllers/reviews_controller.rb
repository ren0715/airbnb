class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    
    if @review.save
      flash[:notice] = "Posted Successfully!"
      redirect_to request.referrer
    else
      flash[:alert] = "You failed! #{@review.content}:#{@review.host_id}:#{@review.guest_id}"
      redirect_to request.referrer
    end
  end

  private
  def review_params
    params.require(:review).permit(:host_id, :guest_id, :room_id, :content,:rate)
  end
end
