class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
  end 

  def edit
  end

  private 

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
