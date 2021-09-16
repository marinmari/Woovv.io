class CoworkingPicturesController < ApplicationController
  def create
    @coworking = Coworking.find(params[:coworking_id])
      if params[:coworking_pictures]
        if @coworking.coworking_pictures.attach(params[:coworking_pictures])
          flash[:success] = "La photo a bien été téléchargée"
          redirect_to edit_coworking_manager_coworking_path(@coworking.id)
        else
          flash.now[:error] = "La photo n'a pu être téléchargée"
          render :edit
        end
      end
  end
  def destroy
    @coworking = Coworking.find(params[:coworking_id])
    if @coworking.coworking_pictures.find(params[:id]).destroy
      flash[:success] = "La photo a bien été supprimée"
      redirect_to edit_coworking_manager_coworking_path(@coworking.id)
    else
      flash.now[:error] = "La photo n'a pu être supprimée"
      render :edit
    end
  end 
end
