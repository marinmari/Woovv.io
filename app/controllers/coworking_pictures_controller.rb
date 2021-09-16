class CoworkingPicturesController < ApplicationController
  def create
    @coworking = Coworking.find(params[:coworking_id])
      if params[:coworking_pictures]
    @coworking.coworking_pictures.attach(params[:coworking_pictures])
    end
    redirect_to(edit_coworking_manager_coworking_path(@coworking.id))
  end
  def destroy
    @coworking = Coworking.find(params[:coworking_id])
    @coworking.coworking_pictures.find(params[:id]).destroy
    redirect_to(edit_coworking_manager_coworking_path(@coworking.id))
  end 
end
