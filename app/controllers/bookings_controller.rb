class BookingsController < ApplicationController
  before_action :set_booking, only: %i(show edit accept reject destroy)
  before_action :disable_nav, only: [:edit]


  def show
  end

  def index
  end

  def new
    @booking = Booking.new
    @booking.date_check_in = params[:date_check_in].to_date
    @booking.date_check_out = params[:date_check_out].to_date
    @booking.total_price =
    @booking.workshop.price * (@booking.date_check_out - @booking.date_check_in + 1)
  end

  def edit
    @craftman = @booking.workshop.craftman
    @workshop = @booking.workshop
  end

  def accept
    if @booking.submitted?
      @booking.status = :accepted
      @booking.save
    end
    redirect_to dashboard_path, notice: "The quotation ' #{@booking.workshop.title} ' has been successfully accepted"
    # à terme rediriger vers la page de paiement que l'on séparera.
  end

  def reject
    @booking.rejected! if @booking.submitted?
    redirect_to dashboard_path, notice: "The quotation for the workshop ' #{@booking.workshop.title} ' has been rejected"
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
    @booking = Booking.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out,
    :total_price, :status)
  end
end
