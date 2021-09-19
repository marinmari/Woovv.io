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
    @booking = Booking.new(start_date:params[:start_date], end_date:params[:end_date], coworking_id: params[:coworking_id], coworker:current_user, booking_status_id:1)
    @booking.save
    puts @booking.errors.full_messages
    redirect_to user_bookings_path(current_user.id)


    # respond_to do |format|
    #   if @booking.save
    #     format.html { redirect_to @booking, notice: "Booking was successfully created." }
    #     format.json { render :show, status: :created, location: @booking }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @booking.errors, status: :unprocessable_entity }
    #   end
    # end
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
