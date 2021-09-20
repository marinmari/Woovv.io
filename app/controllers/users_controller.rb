# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to(user_path(current_user))
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :phone_number, :birth_date)
  end
end
