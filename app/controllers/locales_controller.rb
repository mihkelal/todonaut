# frozen_string_literal: true

class LocalesController < ApplicationController
  def update
    if helpers.logged_in?
      current_user.update!(locale: locale_param)
    else
      session[:locale] = locale_param
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def locale_param
    params.require(:locale)
  end
end
