# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = Users::Create.new
  end

  def create
    @user = Users::Create.new(user_params)
    if @user.save
      helpers.log_in(@user.user)
      redirect_to notes_path, notice: 'Successfully registered.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
