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
    puts "😎"*60
    puts params
    puts params[:coworking]
    puts params[:private_set_up]
    puts "😎"*60
    set_coworking
    unless coworking_params == nil
      @coworking.update(coworking_params)
    end
    unless private_set_up_params == nil
      @private_set_up.update(private_set_up_params)
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
    @private_set_up = @coworking.private_set_up
  end

  def coworking_params
    unless params[:coworking] == nil
      params.require(:coworking).permit(:name, :description, :phone_number, :email)
    end
  end

  def private_set_up_params
    unless params[:private_set_up] == nil
      params.require(:private_set_up).permit(:wifi_password, :manager_phone_number)
    end
  end

end
