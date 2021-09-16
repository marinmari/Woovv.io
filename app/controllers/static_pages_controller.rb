require 'nokogiri'
require 'open-uri'
require 'json'
class StaticPagesController < ApplicationController
  def home
    page = Nokogiri::HTML(open('/Users/amelieloulergue/Desktop/Woovv.io/app/views/static_pages/home.html.erb'))
    pagetoshow = page.xpath('/html/body/div[1]/div/pre')
    @coworking = Coworking.new
    @coworkings = Coworking.all
    puts "je suis dans la home"
    puts pagetoshow
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
