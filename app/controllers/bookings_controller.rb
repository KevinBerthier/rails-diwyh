class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_booking, only: %i(show edit accept reject destroy)
  before_action :disable_nav, only: [:edit]

  before_action :authenticate_user! , only: [ :accept, :reject ]
  before_action :authenticate_craftman! , only: [ :new, :create ]


  def show
  end

  def index
  end

  def new
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "submitted"
    @booking.workshop = Workshop.friendly.find(params[:workshop_id])
    @booking.user = User.find(params[:user_id])
    if @booking.save
      redirect_to workshop_user_messages_path(@booking.workshop, @booking.user), notice: 'Your proposal was successfully sent.'
    else
      redirect_to workshop_user_messages_path(@booking.workshop, @booking.user), alert: "Something went wrong. We can't send your proposal"
    end
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
    :total_price, :status, :description)
  end
end
