class StaticPagesController < ApplicationController
  def home
    @coworking = Coworking.new
    @coworkings = Coworking.all
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
