class CoworkingManager::BookingsController < ApplicationController
  
  # before_action :is_booking_manager?
  # before_action :manages_this_booking?, only: [:edit]
  
  def index
    # @bookings = current_user.bookings
    # @bookings = current_user.managed_coworkings.bookings
  end 

  def create
  end

  def update
  end


  # private 
  # def is_booking_manager?
  #   if Booking.where(coworking_manager: current_user).count < 1 
  #     redirect_to root_path
  #   end
  # end

  # def manages_this_booking?
  #   unless Booking.where(coworking_manager: current_user).include? Booking.find(params[:id])
  #     redirect_to coworking_manager_bookings_path
  #   end
  # end

  # def booking_params
  #   unless params[:booking] == nil
  #     params.require(:booking).permit(:start_date, :end_date)
  #   end
  # end

end
