class CoworkingPicturesController < ApplicationController
  def create
    @coworking = Coworking.find(params[:coworking_id])
    @coworking.coworking_pictures.attach(params[:coworking_pictures])
    redirect_to(coworking_path(@coworking))
  end
end