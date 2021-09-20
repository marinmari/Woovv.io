# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings or /bookings.json
  def index
    @bookings = current_user.bookings.order(:booking_status_id,:start_date)
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @booking = Booking.new
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings or /bookings.json
  def create
    puts "😍"*60
    puts params
    puts "😍"*60
    params.permit!
    # @booking = Booking.new(start_date:params[:start_date], end_date:params[:end_date], coworking_id: params[:coworking_id], coworker:current_user, booking_status_id:1)
    @booking = Booking.new(booking_params)
    @booking.coworking_id = params[:coworking_id]
    @booking.coworker = current_user
    @booking.booking_status_id = 1
    puts @booking
    puts "😍"*60
    if @booking.save
      flash[:success] = "Votre demande de réservation a bien été enregistrée"
      redirect_to user_bookings_path(current_user.id)
    else
      flash[:error] = "Votre demande de réservation n'a pu être enregistrée. Vérfiez bien les paramètres de votre demande"
      puts "😎"*60
      puts @booking.errors.full_messages
      puts "😎"*60
      puts @booking.errors[:end_date]
      puts "😎"*60
      redirect_to coworking_path(params[:coworking_id])
    end


  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    Booking.find(params[:id]).update(booking_status_id: params[:booking_status_id])
    redirect_to user_bookings_path(current_user)
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.fetch(:booking, {})
  end
end

private

def booking_params
    params.require(:booking).permit(:start_date, :end_date)
    # start_date:params[:start_date], end_date:params[:end_date], coworking_id: params[:coworking_id], coworker:current_user, booking_status_id:1
end

def manage_flashes_and_redirection(success)
  if success
    flash[:success] = "Les paramètres du Coworking ont bien été mis à jour"
    redirect_to edit_coworking_manager_coworking_path(params[:id])
  else
    flash.now[:error] = "Les paramètres n'ont pu être mis à jour : vérifiez les messages d'erreurs sur la page"
    render :edit
  end
end