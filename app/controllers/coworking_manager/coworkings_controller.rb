class CoworkingManager::CoworkingsController < ApplicationController
  before_action :is_coworking_manager?
  before_action :manages_this_coworking?, only: [:edit]

  def index
    @coworkings = Coworking.where(coworking_manager: current_user)
  end

  def edit
    set_coworking
  end

  def update
    set_coworking
    unless coworking_params == nil
      @coworking.update(coworking_params)
    end
    unless availability_params == nil
      @availability.update(availability_params)
    end
    unless private_set_up_params == nil
      @private_set_up.update(private_set_up_params)
    end
    unless public_set_up_params == nil
      @public_set_up.update(public_set_up_params)
    end
    redirect_to edit_coworking_manager_coworking_path(params[:id])
  end

  private 
  
  def is_coworking_manager?
    if Coworking.where(coworking_manager: current_user).count < 1 
      redirect_to root_path
    end
  end

  def manages_this_coworking?
    unless Coworking.where(coworking_manager: current_user).include? Coworking.find(params[:id])
      redirect_to coworking_manager_coworkings_path
    end
  end

  def set_coworking
    @coworking = Coworking.where(coworking_manager: current_user).find(params[:id])
    @availability = @coworking.availability
    @private_set_up = @coworking.private_set_up
    @public_set_up = @coworking.public_set_up

  end
  
  def coworking_params
    unless params[:coworking] == nil
      params.require(:coworking).permit(:name, :description, :phone_number, :email)
    end
  end

  def availability_params
    unless params[:availability] == nil
      params.require(:availability).permit(:available_spots_quantity, :price_per_spot_per_day, :is_open_monday, :is_open_tuesday, :is_open_wednesday, :is_open_thursday, :is_open_friday, :is_open_saturday, :is_open_sunday, :week_opening_time, :week_closing_time, :weekend_opening_time, :weekend_closing_time)
    end
  end

  def private_set_up_params
    unless params[:private_set_up] == nil
      params.require(:private_set_up).permit(:wifi_password, :manager_phone_number)
    end
  end

  def public_set_up_params
    unless params[:public_set_up] == nil
      params.require(:public_set_up).permit(:bike_storage_id, :coffee_access_id, :is_pet_friendly, :network_speed)
    end
  end


end
