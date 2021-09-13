class CoworkingManager::CoworkingsController < ApplicationController
  before_action :is_coworking_manager?
  before_action :manages_this_coworking?, only: [:edit]

  def index
    @coworkings = Coworking.where(coworking_manager: current_user)
  end

  def edit
    @coworking = Coworking.where(coworking_manager: current_user).find(params[:id])
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
end
