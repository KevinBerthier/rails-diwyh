class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show update destroy)

  def show
  end

  def index
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def update
  end

  def create
    @booking = Booking.new(booking_params)
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Your booking has been successfully canceled'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = booking.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out,
    :total_price, :status)
  end
end
