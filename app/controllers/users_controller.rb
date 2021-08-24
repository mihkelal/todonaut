# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    authorize(:register)

    @register = Register.new
  end

  def create
    authorize(:register)

    @register = Register.new(user_params)
    if @register.save
      reset_session
      helpers.log_in(@register.user)
      redirect_to notes_path, notice: 'Successfully registered.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
