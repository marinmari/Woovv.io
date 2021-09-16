require 'nokogiri'
require 'open-uri'
require 'json'
class StaticPagesController < ApplicationController
  def home
    @coworking = Coworking.new
    @coworkings = Coworking.all
    puts "je suis dans la home"
    # redirect_to controller: :coworkings, action: :index
  end

  def team
    
  end

  def contact
  end

  def help
  end

  def cgv
  end
end
