require 'json'
class CoworkingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_coworking, only: %i[show edit update destroy]


  # GET /coworkings or /coworkings.json
  def index
    @coworkings = Coworking.all
    @coworkings_selected = []
    if params["geocode_information"]
    geocode_info = JSON.parse(params["geocode_information"])
    info_isAdress = false
    info_isCity = false
    info_isParis = false
    info_isMarseille = false
    info_isLyon = false
    if geocode_info["place_type"][0].to_s == "address" && geocode_info["context"].length < 5
      info_isAdress = true
      zipcode_of_adress = geocode_info["context"][3]["short_code"][3..4]
      puts "jsuis une adress"
    elsif geocode_info["place_type"][0] == "place" && geocode_info["context"].length < 5
      info_isCity = true
      zipcode_of_city = geocode_info["context"][0]["short_code"][3..4]
      puts "jsuis une ville"
    elsif geocode_info["place_type"][0] == "region" 
      info_isParis = true
      zipcode_of_Paris = geocode_info["properties"]["short_code"][3..4]
      puts "jsuis une paris"
    elsif geocode_info["place_type"][0] == "address" && geocode_info["context"].length > 5
      puts geocode_info["context"]
      puts "jsuis une lyon ou marseille"
      if geocode_info["context"][4]["short_code"][3..4] == "13"
        zipcode_of_marseille = geocode_info["context"][4]["short_code"][3..4]
      info_isMarseille = true
      puts zipcode_of_marseille
      puts info_isMarseille
      puts "je suis marseille"
      end 
    else
      puts 'je suis lyon'
      puts geocode_info["context"]
      zipcode_of_lyon = geocode_info["context"][3]["short_code"][3..4]
      info_isLyon = true
    end
    puts "c'est une adresse: #{info_isAdress}"  
    puts "c'est une ville: #{info_isCity}" 
    puts "c'est Paris: #{info_isParis}"
    puts "c'est une adresse: #{zipcode_of_adress}", "c'est une ville: #{zipcode_of_city}", "c'est Paris: #{zipcode_of_Paris}"
    
    
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
      end 
    end 
  end 
    puts @coworkings_selected
    if @coworkings_selected.length == 0
      @coworkings_selected = Coworking.all
    end 
    # puts @coworkings.first.zipcode[0..1].class == zipcode_of_city.class
    # puts @coworkings.first.zipcode[0..1], "coucou"
    # puts zipcode_of_city
    # department = geocode_info["context"][0]["short_code"][3..4]
    # puts '$'*10
    # puts geocode_info
    # puts '$'*10
    # @coworkings.each do |cw|
    #   if geocode_info["place_type"][0].to_s == "address"
    #     if geocode_info["context"][3]["short_code"][3..4] == cw.zipcode[0..2]
    #       @coworkings_selected << cw
    #       puts cw
    #     end 
    #     puts geocode_info["context"][4]["short_code"][3..4]
    #     puts 'cest une adresse'
    #   elsif geocode_info["place_type"][0] == "place"
    #     if geocode_info["context"][0]["short_code"][3..4] == cw.zipcode[0..2]
    #       @coworkings_selected << cw
    #     end 
    #     puts geocode_info["context"][0]["short_code"][3..4]
    #     puts 'c pas une adresse'
    #   else 
    #     if geocode_info["properties"]["short_code"][3..4].to_s == cw.zipcode[0..2]
    #       @coworkings_selected << cw
    #       puts "c'est paname"
    #       puts geocode_info["properties"]["short_code"][3..4].class
    #       puts cw.zipcode[0..2].class
    #       puts cw
    #     end 
    #   end 
    # end 
    # puts @coworkings_selected
    # if params["geocode_information"] == nil 
    #   @coworkings_selected = Coworking.all
    #   @box_focus = "France"
    # else
    #   @coworkings.each do |coworking|
    #     # if coworking.zipcode[0..1] == geocode_info["context"][0]["short_code"][3..4]
    #       # @coworkings_selected << coworkings
    #     # end 
    #   end 
    # end
    puts "ici"
    @coordinates = []
    @co_id = []
    
    @coworkings_selected.each do |coworking|
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