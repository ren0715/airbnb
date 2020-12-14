module ReservationsHelper
  def create
    @reservation = current_user.reservations.new(reservation_params)

    if @reservation.save
      redirect_to root_url
    else
      render 'new'
    end
  end
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total_price, :room_id)
  end
end
