class CoworkingManager::BookingsController < ApplicationController
  before_action :is_user_coworking_manager?
  
  def index
    @bookings = Booking.where(coworking_id:current_user.managed_coworkings.select(:id)).order(:booking_status_id,:start_date)
  end 

  def create
  end

  def update
    Booking.find(params[:id]).update(booking_status_id: params[:booking_status_id])
    redirect_to coworking_manager_bookings_path
  end


  private 

  def is_user_coworking_manager?
    redirect_to root_path if !current_user&.is_coworking_manager?
  end

end
