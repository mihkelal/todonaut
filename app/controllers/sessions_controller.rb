# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @login = Sessions::Login.new
  end

  def create
    @login = Sessions::Login.new(login_params.merge(session: session))
    if @login.save
      redirect_to notes_path, notice: 'Successfully logged in.'
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to notes_path, notice: 'Successfully logged out.'
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
