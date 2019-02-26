# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    if user.present?
      session[:user_id] = user&.id
      redirect_to notes_path, notice: 'Successfully logged in'
    else
      flash.now[:alert] = 'Incorrect username or password'
      render :new
    end
  end

  private

  def user
    User.find_by(username: params[:username])&.authenticate(params[:username])
  end
end
