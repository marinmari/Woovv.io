# frozen_string_literal: true

require 'json'
class CoworkingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_coworking, only: %i[show edit update destroy]

  # GET /coworkings or /coworkings.json
  def index
    puts params[:zip_code]
    @coworkings = Coworking.all
    @coworkings_selected = []
    if params["geocode_information"]
      analyze_geocode_information
    end

    if params[:zip_code]
      @coworkings.each do |coworking|
        if coworking.zipcode[0..1] == params[:zip_code]
          @coworkings_selected << coworking
        end
      end
    end

    if @coworkings_selected.empty?
      @coworkings_selected = @coworkings
      @box_focus = "France"
    end

    @coordinates = []
    @co_id = []

    @coworkings_selected.each do |coworking|
      @coordinates << [coworking.latitude.to_f / 1_000_000, coworking.longitude.to_f / 1_000_000]
      @co_id << coworking.id
    end
  end

  # GET /coworkings/1 or /coworkings/1.json
  def show
    @coordinates = []
    @co_id = []
    @coworking = Coworking.find(params[:id])
    @coordinates << [@coworking.latitude.to_f / 1_000_000, @coworking.longitude.to_f / 1_000_000]
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

  def analyze_geocode_information
    geocode_info = JSON.parse(params["geocode_information"])
    @research_coordinates = geocode_info["geometry"]["coordinates"]
    info_isAdress = false
    info_isCity = false
    info_isParis = false
    info_isMarseille = false
    info_isLyon = false
    info_isDOMTOM = false
    if @research_coordinates[1] < -5
      info_isDOMTOM = true
    elsif geocode_info["place_type"][0].to_s == "address" && geocode_info["context"].length < 5
      info_isAdress = true
      zipcode_of_adress = geocode_info["context"][3]["short_code"][3..4]
    elsif geocode_info["place_type"][0] == "place" && geocode_info["context"].length < 5
      info_isCity = true
      zipcode_of_city = geocode_info["context"][0]["short_code"][3..4]
      if ["2A", "2B"].include?(zipcode_of_city)
        zipcode_of_city = "20"
      end
    elsif geocode_info["place_type"][0] == "region"
      info_isParis = true
      zipcode_of_Paris = geocode_info["properties"]["short_code"][3..4]
    elsif geocode_info["place_type"][0] == "address" && geocode_info["context"].length > 5
      if geocode_info["context"][4]["short_code"][3..4] == "13"
        zipcode_of_marseille = geocode_info["context"][4]["short_code"][3..4]
        info_isMarseille = true
      end
    elsif geocode_info["context"][3]
      zipcode_of_lyon = geocode_info["context"][3]["short_code"][3..4]
      info_isLyon = true
    else
      info_has0 = true
      zip_code_has_0 = geocode_info["context"][1]["short_code"][3..4]
    end
    @coworkings.each do |coworking|
      if info_isParis && coworking.zipcode[0..1] == zipcode_of_Paris
        @coworkings_selected << coworking
      elsif info_isCity && coworking.zipcode[0..1] == zipcode_of_city
        @coworkings_selected << coworking
      elsif info_isAdress && coworking.zipcode[0..1] == zipcode_of_adress
        @coworkings_selected << coworking
      elsif info_isMarseille && coworking.zipcode[0..1] == zipcode_of_marseille
        @coworkings_selected << coworking
      elsif info_isLyon && coworking.zipcode[0..1] == zipcode_of_lyon
        @coworkings_selected << coworking
      elsif info_has0 && coworking.zipcode[0..1] == zip_code_has_0
        @coworkings_selected << coworking
      elsif info_isDOMTOM && coworking.latitude < -5 || coworking.longitude < 41
        @coworkings_selected << coworking
      end
    end
  end
end
