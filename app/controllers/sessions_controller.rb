# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(user_params)
    if @login.save
      helpers.log_in(@login.user)
      redirect_to notes_path, notice: 'Successfully logged in.'
    else
      render :new
    end
  end

  def destroy
    helpers.log_out
    redirect_to notes_path, notice: 'Successfully logged out.'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
