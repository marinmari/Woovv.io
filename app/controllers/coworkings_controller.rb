# frozen_string_literal: true

class CoworkingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_coworking, only: %i[show edit update destroy]

  # GET /coworkings or /coworkings.json
  def index
    @coworking = Coworking.new
    if params[:coworking] == nil || set_zipcode == ''
      @coworkings = Coworking.all
      @box_focus = "France"
    else
      @coworkings = Coworking.all.select { |c| c.zipcode[0..(set_zipcode.length-1)] == set_zipcode }
    end
    @coordinates = []
    @co_id = []
    
    @coworkings.each do |coworking|
      @coordinates << [(coworking.latitude.to_f)/1000000, (coworking.longitude.to_f)/1000000]
      @co_id << coworking.id
    end 
  end

  # GET /coworkings/1 or /coworkings/1.json
  def show
    @coordinates = []
    @co_id = []
    @coworking = Coworking.find(params[:id])
    @coordinates << [(@coworking.latitude.to_f)/1000000, (@coworking.longitude.to_f)/1000000]
    @co_id << @coworking.id

  end

  # GET /coworkings/new
  def new
    @coworking = Coworking.new
  end

  # GET /coworkings/1/edit
  def edit; end

  # POST /coworkings or /coworkings.json
  def create
    @coworking = Coworking.new(coworking_params)

    respond_to do |format|
      if @coworking.save
        format.html { redirect_to @coworking, notice: "Coworking was successfully created." }
        format.json { render :show, status: :created, location: @coworking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coworking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coworkings/1 or /coworkings/1.json
  def update
    respond_to do |format|
      if @coworking.update(coworking_params)
        format.html { redirect_to @coworking, notice: "Coworking was successfully updated." }
        format.json { render :show, status: :ok, location: @coworking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coworking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coworkings/1 or /coworkings/1.json
  def destroy
    @coworking.destroy
    respond_to do |format|
      format.html { redirect_to coworkings_url, notice: "Coworking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coworking
    @coworking = Coworking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def coworking_params
    params.fetch(:coworking, {})
  end
end

def set_zipcode
    @zipcode = params[:coworking][:department]
end