class StaticPagesController < ApplicationController
  def home
  end

  def team

    respond_to do |format|
      format.html { redirect_to team_path }
      format.js { }
    end
  end

  def contact
  end

  def help
  end

  def cgv
  end
end
