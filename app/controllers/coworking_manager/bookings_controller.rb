class CoworkingManager::BookingsController < ApplicationController
  
  
  def index
    @bookings = Booking.where(coworking_id:current_user.managed_coworkings.select(:id)).order(:booking_status_id,:start_date)
  end 

  def create
  end

  def update
    Booking.find(params[:id]).update(booking_status_id: params[:booking_status_id])
    redirect_to coworking_manager_bookings_path
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
