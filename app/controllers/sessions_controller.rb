# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    @login = Login.new(user_params)
    if @login.save
      reset_session
      helpers.log_in(@login.user)
      redirect_to notes_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    helpers.log_out
    reset_session
    redirect_to notes_path, notice: t('.success'), status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
